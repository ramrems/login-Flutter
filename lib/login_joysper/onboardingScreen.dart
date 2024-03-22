import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/login_animasyon/login_tasar%C4%B1m.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';
const colorBlue = const Color(0xff00AACF);

class OnBoard {
  final String title, description;

  OnBoard({
    required this.title,
    required this.description,
  });
}

final OnBoard demoData = OnBoard(
    title: "OnBoarding Sayfası",
    description:
    "Bu sayfa uygulamanın işleyişi hakkında bilgi vermektedir. Uygulamaya giriş yaptıktan sonra karşımıza 3 farklı sayfa çıkacaktır.",
  );

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
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
              Color(0xff00AACF),
              Color(0xFFD9D9D9),
              ],
              tileMode: TileMode.mirror,
            ),
          ),
          child: Column(
            children: [
              // Carousel area
              Expanded(
                child: OnBoardContent(
                  title: demoData.title,
                  description: demoData.description,
                ),
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
                      "Tanıtımı Geç",
                      style: GoogleFonts.dosis(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      context.goNamed('login');
                      _completeOnboarding();
                    },
                    //onPressed: () => context.goNamed('login'),

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

// OnBoarding area widget
class OnBoardContent extends StatelessWidget {
  OnBoardContent({
    super.key,
    required this.title,
    required this.description,
  });

  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          title,
          style: GoogleFonts.dosis(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: GoogleFonts.dosis(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

