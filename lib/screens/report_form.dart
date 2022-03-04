// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

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
    TextEditingController _moreDetials = TextEditingController();
    Size size = MediaQuery.of(context).size;
    print(size.width);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Child Abusing Report',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 24)),
        backgroundColor: Color(0xff219653),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(33),
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ignore: prefer_const_constructors
                Icon(
                  Icons.my_location,
                  color: Colors.black,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                Container(
                  child: const Padding(padding: EdgeInsets.only(left: 10)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2.2),
                    Text("Address", style: TextStyle(fontSize: 16)),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text('180 Cao Thắng, Q.10, TP.HCM'),
                  ],
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ignore: prefer_const_constructors
                Icon(
                  Icons.my_location,
                  color: Colors.black,
                  size: 24.0,
                ),
                Container(
                  child: const Padding(padding: EdgeInsets.only(left: 10)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 2.2),
                    Text("Room, floor,...(Optional)",
                        style: TextStyle(fontSize: 16)),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text('Room 8, Floor 5'),
                  ],
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ignore: prefer_const_constructors
                Icon(
                  Icons.description,
                  color: Colors.black,
                  size: 24.0,
                ),
                Container(
                  child: const Padding(padding: EdgeInsets.only(left: 10)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 2.2),
                    Text("Envidences (Videos, photos, audios)",
                        style: TextStyle(fontSize: 16)),
                  ],
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ignore: prefer_const_constructors
                Container(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(85, 85),
                        primary: Color(0xffE5E5E5),
                        onPrimary: Color.fromARGB(255, 0, 0, 0),
                      ),
                      onPressed: () => {},
                      child: Icon(Icons.add)),
                ),
                Row(
                  children: [
                    Image.asset(
                      'assets/images/owl.jpeg',
                      height: 85,
                      width: 85,
                    ),
                    Image.asset(
                      'assets/images/cow17.png',
                      height: 85,
                      width: 85,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ignore: prefer_const_constructors
                Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 24.0,
                ),
                Container(
                  child: const Padding(padding: EdgeInsets.only(left: 10)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    SizedBox(height: 2.2),
                    Text("More details", style: TextStyle(fontSize: 16)),
                  ],
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            TextFormField(
              controller: _moreDetials,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 60.0, horizontal: 5.0),
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
                child: Text(
                    'BY SUBMITTING THE REPORT, I HEREBY CONFIRM THAT THE ABOVE INFORMATION IS TRUE AND CORRECT',
                    style: TextStyle(fontWeight: FontWeight.bold))),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              // width: 340.0,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff219653),
                    onPrimary: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.all(8.0),
                  ),
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
        ),
      ),
    );
  }
}
