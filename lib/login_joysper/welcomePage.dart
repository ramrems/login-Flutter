
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_page/login_joysper/BottNavBar/ayarlar.dart';

import 'BottNavBar/Anasayfa.dart';
import 'BottNavBar/istatistik.dart';

const colorBlue = const Color(0xff00AACF);
const colorGrey = const Color(0xFFD9D9D9);

class welcomePage extends StatefulWidget {
  final String userMail;
  welcomePage({required this.userMail,Key? key});

  @override
  State<welcomePage> createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  late String userMail;
  @override
  void initState() {
    super.initState();
    userMail = widget.userMail;
  }

  var pageList = <Widget>[];
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    pageList = [
      Anasayfa(label: "Anasayfa", userMail: userMail,),
      istatistik(),
      ayarlar()
    ];

    return Scaffold(
      body: Center(
        child: pageList.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: colorGrey,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon:Icon(Icons.home),
            label: 'Anasayfa',
       /*     icon: Column(
              children: [
                Icon(Icons.home),
                Container(
                    decoration: BoxDecoration(
                      //color: colorBlue,
                      borderRadius: BorderRadius.all( Radius.circular(6)),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:5,right:5,top: 1.0,bottom: 1.0),
                      child: Text('Anasayfa'),
                    ))
              ],
            ) ,
            label: '',*/
  /*          activeIcon: Column(
              children: [
                Icon(Icons.home),
                Container(
                    decoration: BoxDecoration(
                      //color: colorBlue,
                      borderRadius: BorderRadius.all( Radius.circular(6)),
                      boxShadow: [
                        BoxShadow(
                          color: colorBlue.withOpacity(0.2), // Gölge rengi
                          spreadRadius: 2, // Yayılma yarıçapı
                          blurRadius: 1, // Bulanıklık yarıçapı
                          offset: Offset(0, 2), // Gölgenin konumu (x, y)
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:5,right:5,top: 1.0,bottom: 1.0),
                      child: Text('Anasayfa'),
                    ))
              ],
            ),*/
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'istatistik',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'ayarlar',

          ),
        ],
        currentIndex: selectedIndex,

        selectedLabelStyle: GoogleFonts.dosis(
          fontWeight: FontWeight.w600,

          shadows: [
            BoxShadow(
              color: colorBlue,
              blurRadius: 14.0,
              offset: Offset(-1.0, 1.0),
            ),
          ],
    ),
        onTap: _onItemTapped,
          unselectedItemColor: Colors.black,
      ),
    );
  }
}
