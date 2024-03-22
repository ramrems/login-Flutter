import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/login_joysper/welcomePage.dart';
import '../auth_service.dart';
const colorBlue = const Color(0xff00AACF);
const colorGrey = const Color(0xFFD9D9D9);

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi= MediaQuery.of(context);
    final double height= ekranBilgisi.size.height;
    final double width= ekranBilgisi.size.width;

    return Scaffold(
        body:Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Giriş yap",style: TextStyle(fontSize: 39,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8.0, top: 0,bottom: 10),
                child: Text("E-posta adresini gir",style:TextStyle(fontSize:39,fontWeight: FontWeight.bold,),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: height/13,
                  child: TextField(
                    //textAlign: TextAlign.center,
                    decoration: new InputDecoration(
                      hintText: 'E-posta',
                      border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    controller: emailController,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: height/13,
                  child: TextField(
                    controller: passwordController,
                    decoration: new InputDecoration(
                      hintText: 'Şifre',
                      border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    obscureText: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0,right: 8.0, top: 10,bottom: 10),
                child: Center(
                  child: SizedBox(
                    width: width,
                    height: height/13,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                      backgroundColor: colorBlue,
                      foregroundColor: Colors.white,),
                      child: Text("Giriş"),
                      onPressed: () async {
                        if(emailController.text=="" || passwordController.text==""){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("All fields are required!"),backgroundColor: Colors.red,));
                        }
                        else{
                          User? result=await AuthService().login(email: emailController.text.trim(), password: passwordController.text.trim(), context: context);
                          if(result!=null){
                            print("success");
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> welcomePage(userMail: emailController.text.trim(),)),);
                            print("Giriş yapıldı");
                          }
                        }
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        )

    );
  }
}
