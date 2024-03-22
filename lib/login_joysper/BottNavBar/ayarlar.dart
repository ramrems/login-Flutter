import 'package:flutter/material.dart';

class ayarlar extends StatefulWidget {
  const ayarlar({super.key});

  @override
  State<ayarlar> createState() => _ayarlarState();
}

class _ayarlarState extends State<ayarlar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child:Text("Ayarlar"),
        )
    );
  }
}
