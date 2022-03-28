import 'package:challenge/screens/main_page.dart';
import 'package:flutter/material.dart';

class landingPage4 extends StatefulWidget {
  const landingPage4({Key? key}) : super(key: key);

  @override
  State<landingPage4> createState() => _State();
}

class _State extends State<landingPage4> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                  margin: EdgeInsets.only(left: size.width * 0.15),
                  padding: EdgeInsets.only(right: size.height * 0.048),
                  child: Column(
                    children: [
                      Text(
                        'Let\'s protect OUR children',
                        textAlign: TextAlign.start,
                        maxLines: 2,
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
                    'assets/images/image4.png',
                    width: size.width * 0.5,
                    height: size.height * 0.5,
                  ),
                ),
                Container(
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainPage(),
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
