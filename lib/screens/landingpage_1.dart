import 'package:flutter/material.dart';

class landingPage extends StatefulWidget {
  const landingPage({Key? key}) : super(key: key);

  @override
  State<landingPage> createState() => _State();
}

class _State extends State<landingPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              child: Column(children: [
                  Text('Guardian',style: TextStyle(fontFamily: 'Roboto',fontWeight:FontWeight.bold),)
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
