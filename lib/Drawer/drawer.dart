import 'package:dscnsec_app/screens/screen2_events.dart';
import 'package:dscnsec_app/screens/screen3_teams.dart';
import 'package:dscnsec_app/screens/screen4_about.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/screen5_projects.dart';
import '../screens/screen1_home.dart';

final obJECT = HomeScreen();

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color(0xFF4285F4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //upper part
            Padding(
              padding: EdgeInsets.only(top: 10.0, left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 2),
                    child: Text(
                      'More to',
                      style: TextStyle(
                        fontFamily: 'productSans',
                        fontWeight: FontWeight.w400,
                        fontSize: 31,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    'Explore',
                    style: TextStyle(
                        letterSpacing: 5.0,
                        color: Colors.white,
                        fontFamily: 'productSans',
                        fontWeight: FontWeight.w700,
                        fontSize: 35),
                  ),
                ],
              ),
            ),
//Middle part
            Padding(
              padding: EdgeInsets.only(left: 22.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Home tab ->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  GestureDetector(
                      child: Card(
                        color: Color(0xFF4285F4),
                        elevation: 0,
                        child: navItem('Home', Icons.home, context),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                      }),

                  //event tab ->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  GestureDetector(
                    child: Card(
                        color: Color(0xFF4285F4),
                        elevation: 0,
                        child: navItem(
                            'Events', FontAwesomeIcons.calendarCheck, context)),
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => screen2_events()));
                    },
                  ),

                  //projects tab ->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  GestureDetector(
                      child: Card(
                        color: Color(0xFF4285F4),
                        elevation: 0,
                        child: navItem(
                            'Projects', FontAwesomeIcons.lightbulb, context),
                      ),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => ProjectPage()));
                      }),

                  //team tab ->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  GestureDetector(
                      child: Card(
                          color: Color(0xFF4285F4),
                          elevation: 0,
                          child: navItem('Our teams', Icons.people, context)),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => teams()));
                      }),
                  //about us tab ->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  GestureDetector(
                      child: Card(
                          color: Color(0xFF4285F4),
                          elevation: 0,
                          child: navItem('About us', Icons.info, context)),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => about()));
                      }),
                ],
              ),
            ),

            //lower part
            Padding(
              padding: EdgeInsets.only(left: 14.0),
              child: Row(
                children: <Widget>[
                  socialMedia(FontAwesomeIcons.whatsapp),
                  socialMedia(FontAwesomeIcons.twitter),
                  socialMedia(FontAwesomeIcons.telegram),
                  socialMedia(FontAwesomeIcons.globe),
                  //This icon is for App info> Licenses/App version. etc.
                  socialMedia(Icons.perm_device_information),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget socialMedia(IconData icn) {
  return Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: IconButton(
        icon: Icon(icn),
        color: Colors.white,
        onPressed: () {},
      ));
}

Widget navItem(String navTitle, IconData iconData, BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(bottom: 50.0),
    child: Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(
            iconData,
            color: Colors.white,
            size: 24.0,
          ),
        ),
        Text(
          navTitle,
          style: TextStyle(
            fontFamily: 'productSans',
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontSize: 19.0,
          ),
        ),
      ],
    ),
  );
}
