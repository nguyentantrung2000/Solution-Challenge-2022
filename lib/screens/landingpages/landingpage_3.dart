import 'package:challenge/screens/landingpages/landingpage_4.dart';
import 'package:flutter/material.dart';

class landingPage3 extends StatefulWidget {
  const landingPage3({Key? key}) : super(key: key);

  @override
  State<landingPage3> createState() => _State();
}

class _State extends State<landingPage3> {
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
                        'Violence against children can be prevented',
                        textAlign: TextAlign.start,
                        maxLines: 3,
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
                    'assets/images/image3.png',
                    width: size.width * 0.5,
                    height: size.height * 0.45,
                  ),
                ),
                Container(
                  width: size.width,
                  child: Column(
                    children: [
                      ElevatedButton(
                        child: Text(
                          'NEXT',
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
                              builder: (context) => landingPage4(),
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
