import 'package:flutter/material.dart';

class istatistik extends StatefulWidget {
  const istatistik({super.key});

  @override
  State<istatistik> createState() => _istatistikState();
}

class _istatistikState extends State<istatistik> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child:Text("İstatistik"),
        )
    );
  }
}
