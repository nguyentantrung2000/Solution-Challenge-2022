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
                  height: size.height * 0.09,
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
                SizedBox(
                  height: size.height * 0.15,
                ),
                Container(
                  child: Image.asset('images/image1.png'),
                ),
                SizedBox(
                  height: size.height * 0.09,
                ),
                SizedBox(
                  height: size.height * 0.15,
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
                        onPressed: () => {},
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff219653),
                          minimumSize: Size(90, 50),
                        ),
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
                        onPressed: () => {},
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
