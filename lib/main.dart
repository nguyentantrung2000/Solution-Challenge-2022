import 'package:challenge/screens/listview.dart';
import 'package:challenge/screens/main_page.dart';
import 'package:challenge/screens/report_form.dart';
import 'package:challenge/screens/setting_screen.dart';
import 'package:challenge/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:challenge/screens/details.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: 'AIzaSyAUX0GTWAzrESmBsBzIzfiRhY_byZg_gLc',
          appId: '1:977464866865:web:df136f0d798ca69df33d10',
          messagingSenderId: '977464866865',
          projectId: 'flutter-solutionch-202'));
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
        home: detail());
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
