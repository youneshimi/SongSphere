// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, deprecated_member_use, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:songsphere/Pages/secondHome.dart';
import 'package:songsphere/Pages/threeHome.dart';
import 'package:styled_widget/styled_widget.dart';

class FirstHome extends StatefulWidget {
  const FirstHome({Key? key}) : super(key: key);

  @override
  _FirstHomeState createState() => _FirstHomeState();
}

class _FirstHomeState extends State<FirstHome> {
  bool showText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Ajustez la disposition
        children: <Widget>[
          SizedBox(height: 50),
          Align(
            alignment: Alignment.center,
            child: Image.asset('assets/images/logo.png'),
          ),



          
          SizedBox(height: 20),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Là où la musique rencontre l\'innovation',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                AnimatedOpacity(
                  opacity: showText ? 1.0 : 0.0,
                  duration: Duration(seconds: 1),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: Text(
                          'Explorer le monde mélodique avec SongSphere',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),



      SizedBox(height: 50), // Espace entre le texte et les cercles
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    // Premier cercle
    GestureDetector(
      onTap: () {
        // Action à effectuer lorsque le premier cercle est cliqué
        // Vous pouvez laisser cela vide s'il n'y a pas d'action spécifique
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
        Navigator.of(context).push(_customPageRoute(ThreeHome()));
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
    // Fin des cercles
  ],
),




        

        
        SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Ajustez la disposition
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(_customPageRoute(ThreeHome()));
                },
                child: Text(
                  'Skip',
                  style: TextStyle(color: Colors.black),
                ),
              ),

            SizedBox(width: 200), // Ajout d'espace entre les boutons
            ElevatedButton(
              onPressed: () {
                setState(() {
                  showText = false;
                });
                Navigator.of(context).push(_customPageRoute(SecondHome()));
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
                'Next',
                style: TextStyle(color: Colors.white),
              ).fontSize(14),
            ),
          ],
        ),
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
