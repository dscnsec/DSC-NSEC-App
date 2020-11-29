import 'dart:io';

import 'package:circle_list/circle_list.dart';
import 'package:dscnsec_app/Drawer/drawer.dart';
import 'package:dscnsec_app/screens/screen1_home.dart';
import 'package:dscnsec_app/screens/screen2_events.dart';
import 'package:dscnsec_app/screens/screen4_about.dart';
import 'package:dscnsec_app/screens/screen5_projects.dart';
import 'package:dscnsec_app/screens/screen6_developerCredits.dart';
import 'package:dscnsec_app/screens/teams/teamDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../customIcons.dart';
import 'introText.dart';

TextofIntro text = TextofIntro();

class teams extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return teamsState();
  }
}

class teamsState extends State<teams> {
  double xOffset = 0.0;
  double yOffset = 0.0;
  double scalefactor = 1;
  bool isdrawerOpen = false;

////////////////////////////////////////////////////////////////////////////////
  var teamCategory = [
    "App Team\n❯",
    "CP Team\n❯",
    "Design Team\n❯",
    "\nManagementTeam\n❯",
    "ML Team\n❯",
    "Outreach Team\n❯",
    "Web Team\n❯"
  ];

  var teamColor = [
    Colors.redAccent[200],
    Colors.amber,
    Colors.blue[500],
    Colors.teal[500],
    Colors.pink[500],
    Colors.green[500],
    Colors.purple[500]
  ];

////////////////////////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackButtonPressed,
        child: Scaffold(
            body: SafeArea(
                child: Stack(children: <Widget>[
          DrawerScreen(),
          AnimatedContainer(
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
                                        MediaQuery.of(context).size.height *
                                            0.3;
                                    yOffset =
                                        MediaQuery.of(context).size.width *
                                            0.37;
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

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 12, 0, 18),
                        child: Text(
                          ' Our',
                          style: TextStyle(
                            fontFamily: 'productSans',
                            fontSize: 35.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 18),
                        child: Text(
                          'Team',
                          style: TextStyle(
                            fontFamily: 'productSans',
                            fontSize: 35.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[750],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: teamMainBanner(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Center(
                      child: CircleList(
                        showInitialAnimation: true,
                        centerWidget: GestureDetector(
                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context)=> teamDetails("Core Team",Colors.indigo)));
                            debugPrint("Tapped Core Team");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.indigo[100]),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.indigo[200],
                                      offset: Offset.zero,
                                      blurRadius: 10,
                                      spreadRadius: 0)
                                ]),
                            child: CircleAvatar(
                              radius: 56,
                              backgroundColor: Colors.purple[50],
                              child: Center(
                                  child: Text(
                                "Core Team\n➜",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'productSans',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Colors.indigo,
                                ),
                              )),
                            ),
                          ),
                        ),
                        innerRadius: 56,
                        outerRadius: 182,
                        origin: Offset(0, 0),
                        children: List.generate(teamCategory.length, (index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context,MaterialPageRoute(builder: (context)=> teamDetails(teamCategory[index],teamColor[index])));
                              debugPrint("Tapped Team-$index");
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.indigo[300],
                                        offset: Offset.zero,
                                        blurRadius: 5,
                                        spreadRadius: 0)
                                  ]),
                              child: CircleAvatar(
                                radius: 55,
                                backgroundColor: teamColor[index],
                                child: Center(
                                    child: Text(
                                  teamCategory[index],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: 'productSans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                )),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]))));
  }

  //App Exit Alert Function
  Future<bool> _onBackButtonPressed() {
    if (isdrawerOpen == true)
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(
                  "Do you really want to exit app?",
                  style: TextStyle(fontFamily: "productSans"),
                ),
                actions: [
                  FlatButton.icon(
                      onPressed: () => exit(0),
                      icon: Icon(
                        Icons.done,
                        color: Colors.green,
                      ),
                      label: Text(
                        "Yes",
                        style: TextStyle(fontFamily: "productSans"),
                      )),
                  FlatButton.icon(
                      onPressed: () => Navigator.pop(context, false),
                      icon: Icon(
                        Icons.clear,
                        color: Colors.red,
                      ),
                      label: Text(
                        "No",
                        style: TextStyle(fontFamily: "productSans"),
                      ))
                ],
              ));
    else if (isdrawerOpen == false)
      setState(() {
        xOffset = MediaQuery.of(context).size.height * 0.3;
        yOffset = MediaQuery.of(context).size.width * 0.37;
        scalefactor = 0.6;
        isdrawerOpen = true;
      });
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

  // Team Main Banner Image
  Widget teamMainBanner() {
    var assetImage = AssetImage("assets/images/team_main_banner.png");
    var image = Image(
      image: assetImage,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(0),
    );
  }
}
