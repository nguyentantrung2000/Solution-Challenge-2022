import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
void main() {
  runApp(ListView());
}

class ListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListViewState();
  }
}

class ListViewState extends State<ListView> {
  void doingsomething() {}
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: (Column(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total cases: 4',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        letterSpacing: 0.15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Resolved: 1',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          letterSpacing: 0.15,
                          fontWeight: FontWeight.w500),
                    ),
                  ]),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 42),
              child: Column(
                children: [
                  ElevatedButton(
                      onPressed: doingsomething,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(480, 58),
                      ),
                      child: Text('180 Cao Thắng, Q.10, TP.HCM')),
                  SizedBox(height: 19),
                  ElevatedButton(
                      onPressed: doingsomething,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(480, 58),
                      ),
                      child: Text('180 Cao Thắng, Q.10, TP.HCM')),
                  SizedBox(height: 19),
                  ElevatedButton(
                      onPressed: doingsomething,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(480, 58),
                      ),
                      child: Text('180 Cao Thắng, Q.10, TP.HCM')),
                  SizedBox(height: 19),
                  ElevatedButton(
                      onPressed: doingsomething,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(480, 58),
                      ),
                      child: Text('180 Cao Thắng, Q.10, TP.HCM')),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: doingsomething,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(500, 58),
                      primary: Colors.white,
                      padding: EdgeInsets.all(20),
                    ),
                    child: Text(
                      'CHILD ABUSING REPORT',
                      style: TextStyle(color: Color.fromRGBO(33, 150, 83, 1)),
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}
