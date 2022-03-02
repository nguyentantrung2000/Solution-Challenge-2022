import 'package:flutter/material.dart';

class navigate extends StatefulWidget {
  const navigate({ Key? key }) : super(key: key);

  @override
  _navigateState createState() => _navigateState();
}

class _navigateState extends State<navigate> {
  @override
  Widget build(BuildContext context) {
       return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map'
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Lists'
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting'
            )
        ]
        ),
    );
  }
}