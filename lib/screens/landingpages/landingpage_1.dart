import 'package:challenge/screens/landingpages/landingpage_2.dart';
import 'package:challenge/screens/landingpages/landingpage_4.dart';
import 'package:flutter/material.dart';

class landingPage extends StatefulWidget {
  const landingPage({Key? key}) : super(key: key);

  @override
  State<landingPage> createState() => _State();
}

class _State extends State<landingPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              width: size.width,
              height: size.height,
              child: Column(children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                Container(
                  width: size.width,
                  child: Column(
                    children: [
                      Text(
                        'Guardian',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          color: Color(0xff219653),
                          fontSize: 36,
                        ),
                      ),
                      Text(
                        'Save our children',
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontSize: 36,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Image.asset(
                    'assets/images/image1.png',
                    width: size.width * 0.5,
                    height: size.height * 0.5,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.width * 0.03),
                  width: size.width,
                  child: Column(
                    children: [
                      ElevatedButton(
                        child: Text(
                          'START',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.25,
                          ),
                        ),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => landingPage2(),
                            ),
                          ),
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff219653),
                          minimumSize: Size(90, 50),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      ElevatedButton(
                        child: Text(
                          'SKIP',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1.25,
                            color: Color(0xff219653),
                          ),
                        ),
                        onPressed: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => landingPage4(),
                            ),
                          ),
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffffffff),
                          minimumSize: Size(90, 50),
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
