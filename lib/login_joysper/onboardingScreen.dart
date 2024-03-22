import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';
const colorBlue = const Color(0xff00AACF);

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  bool _isFirstTimeUser = true;

  @override
  void initState() {
    super.initState();
    _checkFirstTimeUser();

  }
  Future<void> _checkFirstTimeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTimeUser = prefs.getBool('isFirstTimeUser') ?? true;
    setState(() {
      _isFirstTimeUser = isFirstTimeUser;
    });
  }
  Future<void> _completeOnboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTimeUser', false);
  }

  @override
  Widget build(BuildContext context) {

    var ekranBilgisi= MediaQuery.of(context);
    final double height= ekranBilgisi.size.height;
    final double width= ekranBilgisi.size.width;
    return _isFirstTimeUser ? Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(child: Text("LOGO",style: TextStyle(
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius:3,
                        offset: Offset(1, 1),
                      ),
                    ],
                    fontSize: 20,fontWeight: FontWeight.w900
                ),)),
              ),
              // Carousel area
              Expanded(
                child:Center(child: Text("OnBoarding Sayfası")),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 48.0),
                child: Container(
                  width: width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: colorBlue,
                      foregroundColor: Colors.white,),
                    child: Text(
                      "Giriş Sayfası",
                      style: GoogleFonts.dosis(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      context.goNamed('login');
                      _completeOnboarding();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ):
        loginScreen();
  }
}

