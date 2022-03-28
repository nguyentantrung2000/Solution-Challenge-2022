// ignore_for_file: prefer_const_constructors

import 'package:challenge/screens/details.dart';
import 'package:challenge/screens/report_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class ListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListViewPageState();
  }
}

class ListViewPageState extends State<ListViewPage> {
  List cases = [];
  getData() async {
    final CollectionReference document =
        FirebaseFirestore.instance.collection("reports");
    await document.get().then((value) async => {
          value.docs.forEach((element) => {
                setState(() => {
                      cases.add(
                          {'documentID': element.id, 'data': element.data()}),
                    })
              }),
        });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: size.width,
            margin: EdgeInsets.only(
                top: size.height * 0.05,
                left: size.width * 0.03,
                right: size.width * 0.03),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Total cases: ${cases.length}',
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Resolved: ${(cases.where((x) => x['data']['resolved'] == true).toList().length)}',
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 0.15,
                        fontWeight: FontWeight.w500),
                  ),
                ]),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(size.width * 0.07),
              child: StreamBuilder(
                builder:
                    (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                  return (streamSnapshot.hasData)
                      ? ListView.builder(
                          itemCount: streamSnapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            dynamic data =
                                streamSnapshot.data!.docs[index].data();
                            return Container(
                              padding:
                                  EdgeInsets.only(bottom: size.height * 0.02),
                              decoration: BoxDecoration(),
                              child: ElevatedButton(
                                onPressed: () async {
                                  var temp = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                              streamSnapshot
                                                  .data!.docs[index].id)));
                                  temp == true ? getData() : null;
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: data['resolved']
                                      ? Color(0xff219653)
                                      : Color(0xffE0E0E0),
                                  minimumSize: Size(
                                      size.width * 0.5, size.height * 0.07),
                                ),
                                child: Container(
                                  width: size.width * 0.8,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.67,
                                        child: Text(
                                          data['address'],
                                          style: TextStyle(
                                              color: data['resolved']
                                                  ? Color(0xffFFFFFF)
                                                  : Color(0xff000000),
                                              letterSpacing: 0.5),
                                          softWrap: false,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            Icon(
                                              IconData(0xe22d,
                                                  fontFamily: 'MaterialIcons'),
                                              color: data['resolved']
                                                  ? Color(0xffFFFFFF)
                                                  : Color(0xff000000),
                                            ),
                                            Text(
                                              data['logs'] == null
                                                  ? '0'
                                                  : data['logs']
                                                      .length
                                                      .toString(),
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  color: data['resolved']
                                                      ? Color(0xffFFFFFF)
                                                      : Color(0xff000000)),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })
                      : Center(
                          child: CircularProgressIndicator(),
                        );
                },
                stream: FirebaseFirestore.instance
                    .collection('reports')
                    .snapshots(),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 0.2,
                  blurRadius: 20,
                  offset: Offset(0, -6), // changes position of shadow
                ),
              ],
            ),
            width: size.width,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Report()),
                );
              },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(size.width, size.height * 0.07),
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)))),
              child: Text(
                'CHILD ABUSING REPORT',
                style: TextStyle(
                    color: Color(0xff219653),
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 1.25),
              ),
            ),
          )
        ],
      ),
    );
  }
}
