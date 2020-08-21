import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0.0;
  double yOffset = 0.0;
  double scalefactor = 1;
  bool isdrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(isdrawerOpen ? 35.0 : 0.0),
      ),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scalefactor)
        ..rotateY(isdrawerOpen ? -0.5 : 0.0),
      duration: Duration(milliseconds: 250),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                isdrawerOpen
                    ? IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          setState(() {
                            isdrawerOpen = false;
                            xOffset = 0.0;
                            yOffset = 0.0;
                            scalefactor = 1;
                          });
                        },
                      )
                    : IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          setState(() {
                            xOffset = MediaQuery.of(context).size.height * 0.3;
                            yOffset = MediaQuery.of(context).size.width * 0.37;
                            scalefactor = 0.6;
                            isdrawerOpen = true;
                          });
                        }),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.06),
                  child: Text(
                    'DSC NSEC',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                //profile image of the user...on tap this will open account settings page
                Padding(
                  padding: EdgeInsets.only(right: 12.0,top:5.0),
                  child: CircleAvatar(

                      radius: 29.0,
                    ),
                  ),
                
              ],
            ),
card(Colors.blue),
card(Colors.red),
card(Colors.yellow),
card(Colors.green),
card(Colors.blue),
card(Colors.red),
card(Colors.yellow),
card(Colors.green)

            //All the cards will be here
          ],
        ),
      ),
    );
  }
}

Widget card(Color color) {
  return Padding(
    padding: EdgeInsets.all(10.0),
    child: Container(
      height: 140.0,
      width: 140.0,
      color: color,
    ),
  );
}
// MediaQuery.of(context).size.height * 0.3
// MediaQuery.of(context).size.width * 0.35;
