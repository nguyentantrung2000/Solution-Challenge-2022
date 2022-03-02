import 'package:challenge/screens/listview.dart';
import 'package:challenge/screens/report_form.dart';
import 'package:challenge/screens/setting_screen.dart';
import 'package:challenge/screens/map_screen.dart';
import 'package:flutter/material.dart';

class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Text('THIS IS A MAPS PAGE!!!'),
    );
  }
}
