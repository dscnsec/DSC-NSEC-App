import 'package:dscnsec_app/screens/screen2_events.dart';
import 'package:dscnsec_app/screens/screen3_teams.dart';
import 'package:dscnsec_app/screens/screen4_about.dart';
import 'package:dscnsec_app/screens/screen6_developerCredits.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/screen5_projects.dart';
import '../screens/screen1_home.dart';

final obJECT = HomeScreen();
var fontWeight_home = FontWeight.w800;
var fontWeight_events = FontWeight.w300;
var fontWeight_projects = FontWeight.w300;
var fontWeight_teams = FontWeight.w300;
var fontWeight_about = FontWeight.w300;
var fontWeight_devCredits = FontWeight.w300;

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
                        fontWeight: FontWeight.w300,
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
                        fontWeight: FontWeight.w800,
                        fontSize: 35),
                  ),
                ],
              ),
            ),
//Middle part
            Padding(
              padding: EdgeInsets.only(top: 11, left: 22.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Home tab ->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  GestureDetector(
                      child:
                          navItem('Home', Icons.home, context, fontWeight_home),
                      onTap: () {
                        resetFontWeights();
                        fontWeight_home = FontWeight.w800;

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                      }),

                  //event tab ->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  GestureDetector(
                    child: navItem('Events', FontAwesomeIcons.calendarCheck,
                        context, fontWeight_events),
                    onTap: () {
                      resetFontWeights();
                      fontWeight_events = FontWeight.w800;

                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => screen2_events()));
                    },
                  ),

                  //projects tab ->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  GestureDetector(
                      child: navItem('Projects', FontAwesomeIcons.lightbulb,
                          context, fontWeight_projects),
                      onTap: () {
                        resetFontWeights();
                        fontWeight_projects = FontWeight.w800;

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => ProjectPage()));
                      }),

                  //team tab ->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  GestureDetector(
                      child: navItem(
                          'Our teams', Icons.people, context, fontWeight_teams),
                      onTap: () {
                        resetFontWeights();
                        fontWeight_teams = FontWeight.w800;

                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => teams()));
                      }),
                  //about us tab ->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  GestureDetector(
                      child: navItem(
                          'About us', Icons.info, context, fontWeight_about),
                      onTap: () {
                        resetFontWeights();
                        fontWeight_about = FontWeight.w800;

                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => about()));
                      }),
                  //Developer Credits ->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
                  GestureDetector(
                      child: navItem('Developer\nCredits', Icons.developer_mode,
                          context, fontWeight_devCredits),
                      onTap: () {
                        resetFontWeights();
                        fontWeight_devCredits = FontWeight.w800;

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => developerCredits()));
                      }),
                ],
              ),
            ),

            //footer part
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                children: <Widget>[
                  socialMedia(FontAwesomeIcons.whatsapp),
                  socialMedia(FontAwesomeIcons.twitter),
                  socialMedia(FontAwesomeIcons.facebook),
                  socialMedia(FontAwesomeIcons.instagram),
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
      padding: EdgeInsets.only(right: 0, bottom: 5),
      child: IconButton(
        icon: Icon(
          icn,
          size: 25,
        ),
        color: Colors.white,
        onPressed: () {},
      ));
}

Widget navItem(
    String navTitle, IconData iconData, BuildContext context, FontWeight fw) {
  return Padding(
    padding: EdgeInsets.only(bottom: 40.0),
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
            fontWeight: fw,
            color: Colors.white,
            fontSize: 19.0,
          ),
        ),
      ],
    ),
  );
}

void resetFontWeights() {
  fontWeight_home = FontWeight.w300;
  fontWeight_events = FontWeight.w300;
  fontWeight_projects = FontWeight.w300;
  fontWeight_teams = FontWeight.w300;
  fontWeight_about = FontWeight.w300;
  fontWeight_devCredits = FontWeight.w300;
}

void setFontWeightBoldForEventsTabCalledFromHome() {
  resetFontWeights();
  fontWeight_events = FontWeight.w800;
}
