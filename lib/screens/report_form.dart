// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:challenge/api/firebase_api.dart';
import 'package:path/path.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  CollectionReference reports =
      FirebaseFirestore.instance.collection('reports');

  UploadTask? task;
  File? imageURI;
  final ImagePicker _picker = ImagePicker();
  var Latitude = 0.0;
  var Longitude = 0.0;
  List _imageList = [];
  TextEditingController _moreDetails = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _optional = TextEditingController();
  Future selectFile() async {
    try {
      final XFile? images =
          await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _imageList.add(images!);
      });
    } catch (e) {
      print(e);
    }
  }

  String _myAddress = '...';
  void determinePosition() async {
    try {
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        Latitude = position.latitude;
        Longitude = position.longitude;
      });
      String myUrl =
          'https://api.opencagedata.com/geocode/v1/json?key=8cdaef3a4f7041548629225833ddd204&q=$Latitude,$Longitude';
      var req = await http.get(Uri.parse(myUrl));
      var response = convert.jsonDecode(req.body);
      setState(() {
        _myAddress = response['results'][0]['formatted'];
      });
    } catch (error) {}
  }

  void initState() {
    // TODO: implement initState
    determinePosition();
    super.initState();
  }

  Future _uploadReport(BuildContext context) async {
    if (_imageList.length == 0) return;

    final _id = DateTime.now().millisecondsSinceEpoch;
    var _imageURL = [];
    for (var i = 0; i < _imageList.length; i++) {
      var file = File(_imageList[i].path);
      final fileName = basename(file.path);
      final destination = '$_id/$fileName';
      task = FirebaseApi.uploadFile(destination, file);

      if (task == null) return;

      final snapshot = await task!.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();
      _imageURL.add(urlDownload);
    }
    Navigator.of(context).pop();
    reports
        .add({
          "address": _myAddress,
          "optional": _optional.text.trim(),
          "imagesURL": _imageURL,
          "details": _moreDetails.text.trim(),
          "lat": Latitude,
          "long": Longitude,
          "time": _id,
          "id": _id,
          "logs": [],
          "resolved": false
        })
        .then((value) => {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ListViewPage()),
              // )
            })
        .catchError((onError) => {print('Create report failed!!!')});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(_imageList.length);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Child Abusing Report',
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255), fontSize: 24)),
        backgroundColor: Color(0xff219653),
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Latitude == 0
          ? Center(
              child: Text('Loading...'),
            )
          : SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(33),
                child: Column(children: [
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
                            margin: EdgeInsets.only(left: 10),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 33),
                        child: Text(
                          _myAddress,
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
                            margin: EdgeInsets.only(left: 10),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 33),
                        width: size.width * 0.8,
                        child: TextFormField(
                          controller: _optional,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            hintText: "...",
                          ),
                        ),
                      ),
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
                        child:
                            const Padding(padding: EdgeInsets.only(left: 10)),
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
                  _imageList.length == 0
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(85, 85),
                                    primary: Color(0xffE5E5E5),
                                    onPrimary: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                  onPressed: () => {selectFile()},
                                  child: Icon(Icons.add)),
                            )
                          ],
                        )
                      : LimitedBox(
                          maxHeight: 200,
                          child: GridView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: _imageList.length + 1,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      crossAxisSpacing: 8,
                                      mainAxisSpacing: 4),
                              itemBuilder: (context, index) {
                                return index == _imageList.length
                                    ? Container(
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              fixedSize: Size(85, 85),
                                              primary: Color(0xffE5E5E5),
                                              onPrimary:
                                                  Color.fromARGB(255, 0, 0, 0),
                                            ),
                                            onPressed: () => {selectFile()},
                                            child: Icon(Icons.add)),
                                      )
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        child: Image.file(
                                          File(_imageList[index].path),
                                          fit: BoxFit.cover,
                                        ),
                                      );
                              }),
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
                        child:
                            const Padding(padding: EdgeInsets.only(left: 10)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          SizedBox(height: 2.2),
                          Text("More details", style: TextStyle(fontSize: 16)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  TextField(
                    controller: _moreDetails,
                    keyboardType: TextInputType.multiline,
                    minLines: 5,
                    maxLines: 10,
                    decoration: const InputDecoration(
                        // ignore: unnecessary_const
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
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
                          if (_moreDetails.text.trim() == "") {
                            return;
                          } else {
                            _uploadReport(context);
                          }
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
