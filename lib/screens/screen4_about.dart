import 'dart:io';

import 'package:dscnsec_app/Drawer/drawer.dart';
import 'package:dscnsec_app/screens/screen1_home.dart';
import 'package:dscnsec_app/screens/screen2_events.dart';
import 'package:dscnsec_app/screens/screen3_teams.dart';
import 'package:dscnsec_app/screens/screen5_projects.dart';
import 'package:dscnsec_app/screens/screen6_developerCredits.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../customIcons.dart';
import 'introText.dart';

TextofIntro text = TextofIntro();

class about extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
 return aboutState();

  }

}
class aboutState extends State<about>{

  double xOffset = 0.0;
  double yOffset = 0.0;
  double scalefactor = 1;
  bool isdrawerOpen = false;

  @override
  Widget build(BuildContext context) {
return WillPopScope(
    onWillPop: _onBackPressed,
    child: Scaffold(
    body: SafeArea(
        child: Stack(children: <Widget>[
          DrawerScreen(),
          AnimatedContainer(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(isdrawerOpen ? 35.0 : 0.0),
            ),
            transform: Matrix4.translationValues(xOffset, yOffset, 0)
              ..scale(scalefactor)
              ..rotateY(isdrawerOpen ? -0.5 : 0.0),
            duration: Duration(milliseconds: 250),
            child: SingleChildScrollView(
              child: Column(
                //  mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: isdrawerOpen
                              ? Radius.circular(35.0)
                              : Radius.circular(0.0)),
                      color: Colors.white,
                    ),
                    child: Row(
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
                            icon: Icon(CustomIcons.menu),
                            onPressed: () {
                              setState(() {
                                xOffset =
                                    MediaQuery.of(context).size.height * 0.3;
                                yOffset =
                                    MediaQuery.of(context).size.width * 0.37;
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
                              fontFamily: 'productSans',
                              fontWeight: FontWeight.w600,
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                        //profile image of the user...on tap this will open account settings page
                        Padding(
                          padding: EdgeInsets.only(right: 12.0, top: 5.0),
                          child: CircleAvatar(
                            radius: 29.0,
                            child: dsclogo(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //YOUR CODE GOES HERE ->> DSC NSEC EVENTS SECTION ->

                  Text(
                    "Welcome to Upcoming About Section",
                    style: TextStyle(fontSize: 25, fontFamily: 'Google-Sans'),
                  ),
                ],
              ),
            ),
          ),
        ]))));
  }
  //App Exit Alert Function
  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Center(
            child: Text(
              "Where to Go!",
              style: TextStyle(fontFamily: "productSans"),
            ),
          ),
          actions: [
            Center(
              child: FlatButton.icon(
                  onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => HomeScreen())),
                  icon: Icon(
                    Icons.home,
                    color: Colors.blue,
                    size: 30,
                  ),
                  label: Text(
                    "Home",
                    style: TextStyle(fontFamily: "productSans"),
                  )),
            ),
            Center(
              child: FlatButton.icon(
                  onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => screen2_events())),
                  icon: Icon(
                    Icons.event_available,
                    color: Colors.blue,
                  ),
                  label: Text(
                    "Events",
                    style: TextStyle(fontFamily: "productSans"),
                  )),
            ),
            Center(
              child: FlatButton.icon(
                  onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => ProjectPage())),
                  icon: Icon(
                    Icons.lightbulb_outline,
                    color: Colors.blue,
                    size: 28,
                  ),
                  label: Text(
                    "Projects",
                    style: TextStyle(fontFamily: "productSans"),
                  )),
            ),
            Center(
              child: FlatButton.icon(
                  onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => teams())),
                  icon: Icon(
                    Icons.people,
                    color: Colors.blue,
                  ),
                  label: Text(
                    "Our Teams",
                    style: TextStyle(fontFamily: "productSans"),
                  )),
            ),
            Center(
              child: FlatButton.icon(
                  onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => about())),
                  icon: Icon(
                    Icons.info_outline,
                    color: Colors.blue,
                  ),
                  label: Text(
                    "About Us",
                    style: TextStyle(fontFamily: "productSans"),
                  )),
            ),

            Center(
              child: FlatButton.icon(
                  onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => developerCredits())),
                  icon: Icon(
                    Icons.developer_mode,
                    color: Colors.blue,
                  ),
                  label: Text(
                    "Developer\nCredits",
                    style: TextStyle(fontFamily: "productSans"),
                  )),
            ),

            Container(padding: EdgeInsets.only(bottom: 15),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: FlatButton.icon(
                        onPressed: () => exit(0),
                        icon: Icon(
                          Icons.exit_to_app,
                          color: Colors.green,
                        ),
                        label: Text(
                          "Exit App",
                          style: TextStyle(fontFamily: "productSans"),
                        ))),
                Center(
                    child: FlatButton.icon(
                        onPressed: () => Navigator.pop(context, false),
                        icon: Icon(
                          Icons.clear,
                          color: Colors.red,
                        ),
                        label: Text(
                          "Close",
                          style: TextStyle(fontFamily: "productSans"),
                        )))
              ],)
          ],
        ));
  }
  // DSC NSEC LOGO
  Widget dsclogo() {
    var assetImage = AssetImage("assets/images/dsclogo.png");
    var image = Image(
      image: assetImage,
      height: 100,
      width: 100,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(0),
    );
  }
}