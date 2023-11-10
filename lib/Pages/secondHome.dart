// secondHome.dart
import 'package:flutter/material.dart';

import 'threeHome.dart';

class SecondHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SongSphere'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'SongSphere est une expérience musicale unique',
            ),
            SizedBox(height: 20),
            Image.asset('assets/images/logo.png'),
            SizedBox(height: 50),
            Text(
              'Vibrez au rythme de votre univers sonore',
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThreeHome()),
                );
              },
              child: Text('Découvrir SongSphere'),
            ),
          ],
        ),
      ),
    );
  }
}
