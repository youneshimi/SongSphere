// ignore: file_names
import 'package:flutter/material.dart';
import 'package:songsphere/Pages/secondHome.dart';

class FirstHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SongSphere'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 50),
          Center(
            child: Image.asset('assets/images/logo.png'),
          ),
          SizedBox(height: 50),
          Center(
            child: Text(
              'Transformez votre vie avec la musique',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondHome()),
                );
              },
              child: Text('Explorez'),
            ),
          ),
        ],
      ),
    );
  }
}
