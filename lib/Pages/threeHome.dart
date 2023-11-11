// threeHome.dart
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:songsphere/Pages/firstHome.dart';
import 'package:songsphere/Pages/secondHome.dart';
import 'package:styled_widget/styled_widget.dart';

class ThreeHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[




                    // Nouveau cercle en haut à gauche
       GestureDetector(
  onTap: () {
    Navigator.of(context).push(_customPageRoute(FirstHome()));
  },
  child: Container(
    margin: EdgeInsets.only(top: 40, right: 300),
    width: 90,
    height: 40,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Color.fromRGBO(255, 0, 0, 0.301), // Utilisez Color.fromRGBO pour spécifier l'opacité
    ),
    child: Icon(
      Icons.home,
      color: Colors.white,
    ),
  ),
),









          SizedBox(height: 30),
          SizedBox(height: 30),
          Center(
            child: Image.asset('assets/images/logo.png'),
          ),
          SizedBox(height: 50),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Vivez la magie musicale',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: Text(
                        'Avec SongSphere',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),




          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Premier cercle
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(_customPageRoute(FirstHome()));
                },
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(width: 5),
              // Deuxième cercle
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(_customPageRoute(SecondHome()));
                },
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(width: 5),
              // Troisième cercle
              GestureDetector(
                onTap: () {
                  // Action à effectuer lorsque le troisième cercle est cliqué
                  // (Dans cet exemple, il n'y a pas d'action spécifique)
                },
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
              ),
              // Fin des cercles
            ],
          ),





          SizedBox(height: 50),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(_customPageRoute(ThreeHome()));
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
              ),
              child: Text(
                'Get Started',
                style: TextStyle(color: Colors.white),
              ).fontSize(14),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }



  PageRouteBuilder _customPageRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutQuart;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
