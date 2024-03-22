import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  String label;
  String userMail;

  Anasayfa({required this.label,required this.userMail,super.key});
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Text("Merhaba "+ widget.userMail),
              ],
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.label),
              ],
            ),
          ),
        ],
      )
    );
  }
}
