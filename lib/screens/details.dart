// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:ffi';

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
import 'package:platform_device_id/platform_device_id.dart';

class DetailScreen extends StatefulWidget {
  final String _idDoc;
  const DetailScreen(this._idDoc);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  CollectionReference reports =
      FirebaseFirestore.instance.collection('reports');
  String? _deviceId;
  bool loadDone = false;
  @override
  void initState() {
    super.initState();
    _getDocId();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String? deviceId;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      deviceId = await PlatformDeviceId.getDeviceId;
    } on PlatformException {
      deviceId = 'Failed to get deviceId.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _deviceId = deviceId;
      print("deviceId->$_deviceId");
    });
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
        loadDone = true;
      });
      // print(document.data());
    } catch (err) {
      print(err);
    }
  }

  Future updateReport() async {
    if (!(_report['logs'] == null ? [] : _report['logs'] as List)
        .contains(_deviceId)) {
      try {
        await reports.doc(widget._idDoc).update({
          'logs': [
            ..._report['logs'] != null ? _report['logs'] : [],
            _deviceId
          ],
        });
        _getDocId();
      } catch (err) {
        print(err);
      }
    } else {
      print("Already logged");
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _moreDetails = TextEditingController();
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
        child: loadDone
            ? Stack(
                children: [
                  Positioned.fill(
                    top: size.height * 0.81,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: ElevatedButton(
                        onPressed: (_report['logs'] == null
                                    ? []
                                    : _report['logs'] as List)
                                .contains(_deviceId)
                            ? null
                            : () {
                                updateReport();
                                print(_deviceId);
                              },
                        child: (_report['logs'] == null
                                    ? []
                                    : _report['logs'] as List)
                                .contains(_deviceId)
                            ? const Text('Already feedback')
                            : const Text('Feedback'),
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
                                child: Text(
                                    _report != null ? _report['optional'] : ""),
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
                                child: Text(
                                    _report != null ? _report['details'] : ""),
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
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  key: UniqueKey(),
                                  children: [
                                    for (var i = 0;
                                        i < _report['imagesURL'].length;
                                        i++)
                                      GestureDetector(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                                                    imagePath:
                                                        _report['imagesURL']
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
              )
            : Center(
                child: CircularProgressIndicator(),
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
