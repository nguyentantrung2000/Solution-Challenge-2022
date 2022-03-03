import 'package:challenge/screens/listview.dart';
import 'package:challenge/screens/main_page.dart';
import 'package:challenge/screens/report_form.dart';
import 'package:challenge/screens/setting_screen.dart';
import 'package:challenge/screens/map_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        home: ListViewPage(
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: screens[currentIndex],
    
    );
  }
}
