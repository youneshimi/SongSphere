// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:songsphere/Pages/firstHome.dart';
import 'package:songsphere/Pages/threeHome.dart';
import 'package:styled_widget/styled_widget.dart';

class SecondHome extends StatefulWidget {
  @override
  _SecondHomeState createState() => _SecondHomeState();
}

class _SecondHomeState extends State<SecondHome> {
  bool showText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 50),
          Center(
            child: Image.asset('assets/images/logo.png'),
          ),
          SizedBox(height: 20),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Vibrez au rythme de votre univers sonore',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                      opacity: 0.5,
                      child: Text(
                        'Une expérience musicale unique.',
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




          SizedBox(height: 50),
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
                // Action à effectuer lorsque le deuxième cercle est cliqué
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(_customPageRoute(FirstHome()));
                },
                child: Text(
                  'Previous',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(width: 200),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    showText = false;
                  });
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
                  'Next',
                  style: TextStyle(color: Colors.white),
                ).fontSize(14),
              ),
            ],
          ),
          SizedBox(height: 20),
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
