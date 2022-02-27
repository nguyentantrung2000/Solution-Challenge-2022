import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Child Abusing Report',
            style: TextStyle(color: Colors.black, fontSize: 24)),
        backgroundColor: Colors.white,
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(top: 33, left: 33, right: 33, bottom: 0),
          child: Row(
            children: [
              Icon(
                Icons.my_location,
                color: Colors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              Container(
                child: Padding(padding: EdgeInsets.only(left: 10)),
              ),
              Text("Address", style: TextStyle(fontSize: 16))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 39, top: 30),
          child: Row(
            children: [
              Text('180 Cao Thắng, Q.10, TP.HCM'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 33, left: 33, right: 33, bottom: 0),
          child: Row(
            children: [
              Icon(
                Icons.my_location,
                color: Colors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              Container(
                child: Padding(padding: EdgeInsets.only(left: 10)),
              ),
              Text("Room, Floor,... (Optional)", style: TextStyle(fontSize: 16))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 39, top: 30),
          child: Row(
            children: [
              Text('Room 8, Floor 5'),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 33, left: 33, right: 33, bottom: 0),
          child: Row(
            children: [
              Icon(
                Icons.description,
                color: Colors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              Container(
                child: Padding(padding: EdgeInsets.only(left: 10)),
              ),
              Text("Envidences (Videos, photos, audios)",
                  style: TextStyle(fontSize: 16))
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 39, top: 30), //button
        ),
        Padding(
          padding: const EdgeInsets.only(right: 230.0),
          child: FlatButton(
                onPressed: () => {},
                color: Color.fromARGB(255, 216, 216, 216),
                padding: EdgeInsets.all(10.0),
                child: Column( // Replace with a Row for horizontal icon + text
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(20), child:
                    Icon(Icons.add)
                    ),
                  ],
                ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 33, left: 33, right: 33, bottom: 0),
          child: Row(
            children: [
              Icon(
                Icons.edit,
                color: Colors.black,
                size: 24.0,
                semanticLabel: 'Text to announce in accessibility modes',
              ),
              Container(
                child: Padding(padding: EdgeInsets.only(left: 10)),
              ),
              Text("More details", style: TextStyle(fontSize: 16))
            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 17)),
        Center(
          child: Container(
            margin: const EdgeInsets.only(right: 22, left: 22),
            child: TextField(
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 29)),
        Center(
          child: Container(
              width: 340.0,
              child: Text(
                'BY SUBMITTING THE REPORT, I HEREBY CONFIRM THAT THE ABOVE INFORMATION IS TRUE AND CORRECT',
                style: TextStyle(fontWeight: FontWeight.bold),
              )),
        ),
        Padding(padding: EdgeInsets.only(top: 40)),
        Container(
          // width: 340.0,
          margin: const EdgeInsets.only(right: 22, left: 22),
          child: FlatButton(
              color: Color.fromARGB(255, 16, 138, 0),
              textColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              onPressed: () {
                /*...*/
              },
              child: Align(
                alignment: Alignment.center,
                child: Text("REPORT",
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center),
              )),
        )
      ]),
    );
  }
}
