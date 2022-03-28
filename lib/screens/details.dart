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

class DetailScreen extends StatefulWidget {
  String _idDoc;
  DetailScreen(this._idDoc);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
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
        title: const Text('Details',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 24)),
        backgroundColor: Color(0xff219653),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            Positioned.fill(
              top: size.height * 0.75,
              child: Container(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {
                    print('Hello');
                  },
                  child: const Text('Feedback'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                    shadowColor: Colors.redAccent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(33),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.my_location,
                              color: Colors.black,
                              size: 24.0,
                            ),
                            Container(
                              child: Text(
                                "Address",
                                style: TextStyle(fontSize: 16),
                              ),
                              margin: EdgeInsets.only(left: 7),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 30),
                          child: Text(
                            _report != null ? _report['address'] : "",
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.my_location,
                              color: Colors.black,
                              size: 24.0,
                            ),
                            Container(
                              child: Text(
                                "Room, floor,...(Optional)",
                                style: TextStyle(fontSize: 16),
                              ),
                              margin: EdgeInsets.only(left: 7),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 30),
                          child:
                              Text(_report != null ? _report['optional'] : ""),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.black,
                              size: 24.0,
                            ),
                            Container(
                              child: Text(
                                "More details",
                                style: TextStyle(fontSize: 16),
                              ),
                              margin: EdgeInsets.only(left: 7),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 30),
                          child:
                              Text(_report != null ? _report['details'] : ""),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.description,
                          color: Colors.black,
                          size: 24.0,
                        ),
                        Container(
                          child: Text(
                            "Envidences (Videos, photos, audios)",
                            style: TextStyle(fontSize: 16),
                          ),
                          margin: EdgeInsets.only(left: 7),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    _report == null
                        ? Center(
                            child: Text("No images, videos, audios"),
                          )
                        // : Row(children: <Widget>[
                        //     for (var i = 0; i < _report['imagesURL'].length; i++)
                        //       Image.network(_report['imagesURL'][i], height: 85)
                        //   ]),
                        : GridView.count(
                            crossAxisCount: 3,
                            addRepaintBoundaries: true,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            key: UniqueKey(),
                            children: [
                              for (var i = 0;
                                  i < _report['imagesURL'].length;
                                  i++)
                                GestureDetector(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.network(
                                      _report['imagesURL'][i],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) {
                                          return DetailImage(
                                              imagePath: _report['imagesURL']
                                                  [i]);
                                        },
                                        fullscreenDialog: true,
                                      ),
                                    );
                                  },
                                ),
                            ],
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class DetailImage extends StatelessWidget {
  String imagePath;
  String imageName;
  DetailImage({Key? key, required this.imagePath, this.imageName = ''})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ảnh ' + imageName,
          overflow: TextOverflow.fade,
        ),
        backgroundColor: Color(0xff219653),
      ),
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image.network(
              imagePath,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
