// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:challenge/api/firebase_api.dart';
import 'package:challenge/widget/button_widget.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';

class detail extends StatefulWidget {
   String _idDoc;
  detail(this._idDoc);



  @override
  State<detail> createState() => _detailState();
}

class _detailState extends State<detail> {
  CollectionReference reports =
      FirebaseFirestore.instance.collection('reports');



  void initState() {
    // TODO: implement initState
    super.initState();
    _getDocId();
  }

  String? address;
  String? optional;
  String? details;
  List<String> imageList = [];
  dynamic _report;
  Future _getDocId() async {
    try {
      var document = await reports.doc(widget._idDoc).get();
      setState(() {
        _report = document.data();
      });
      // print(document.data());
      print(_report['address']);
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _moreDetials = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Details child Abusing Report',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 24)),
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
                    Text(_report != null ? _report['address'] : ""),
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
                    const Text("Room, floor,...(Optional)",
                        style: TextStyle(fontSize: 16)),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(_report != null ? _report['optional'] : ""),
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
                  children: [
                    SizedBox(height: 2.2),
                    Text("More details", style: TextStyle(fontSize: 16)),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Text(_report != null ? _report['details'] : ""),
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
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
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
            _report == null
                ? Center(
                    child: Text("No images, videos, audios"),
                  )
                : Row(children: <Widget>[
                    for (var i = 0; i < _report['imagesURL'].length; i++)
                      Image.network(_report['imagesURL'][i], height: 85)
                  ]),
                // : Container(
                //     // padding: EdgeInsets.all(12.0),
                //     // child: GridView.builder(
                //     //   itemCount: _report['imagesURL'].length,
                //     //   gridDelegate:
                //     //       const SliverGridDelegateWithFixedCrossAxisCount(
                //     //           crossAxisCount: 2,
                //     //           crossAxisSpacing: 4.0,
                //     //           mainAxisSpacing: 4.0),
                //     //   itemBuilder: (BuildContext context, int index) {
                //     //     return Image.network(_report['imagesURL'][index],
                //     //         height: 85);
                //     //   },
                //     // )
                //   ),
          ]),
        ),
      ),
    );
  }
}
