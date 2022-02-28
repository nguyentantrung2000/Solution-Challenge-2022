import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final language = ['English', 'Vietnamese'];
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 90, left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Setting',
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text('Language',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          // Padding(
          //     padding: EdgeInsets.only(),
          //     child: DropdownButton<String>(
          //       value: value,
          //       isExpanded: true,
          //       items: language.map(buildMenuItem).toList(),
          //       onChanged: (value) => setState(() => this.value = value),
          //     ))
        ],
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
