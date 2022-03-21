// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:permission_handler/permission_handler.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final language = ['English', 'Vietnamese'];
  void askPermission() {
    Permission.location.request().then((value) => {
          if (value.isGranted)
            {
              print("Cho phép nè"),
            }
          else
            {print("Từ chối rồi")}
        });
  }

  String? value="English";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(width: size.width,height: size.height* 0.0 ),
            Text('Setting',
            style: TextStyle(
              color: Colors.black,
        
              fontSize:34,
            )),
 

            // Text('Setting',
            //     style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('Language',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            SizedBox(
              width: size.width,
              child: Container(
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      // blurRadius: 2,
                      offset: Offset(0, 4),
                    )
                  ],
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    iconSize: 26,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                    value:value,
                    // style: TextStyle(fontWeight: FontWeight.bold),
                    isExpanded: true,

                    items: language.map(buildMenuItem).toList(),
                    
                    onChanged: (value) => setState(() => this.value = value),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 35),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(500, 40),
                    primary: Color.fromRGBO(33, 150, 83, 1)),
                onPressed: askPermission,
                child: Text('GRANT LOCATION PERMISSION'))
          ],
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );
}
