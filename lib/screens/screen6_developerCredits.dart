import 'dart:io';

import 'package:dscnsec_app/Drawer/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:url_launcher/url_launcher.dart';

import '../customIcons.dart';
import 'introText.dart';

TextofIntro text = TextofIntro();

class developerCredits extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return developerCreditsState();
  }
}

class developerCreditsState extends State<developerCredits> {
  double xOffset = 0.0;
  double yOffset = 0.0;
  double scalefactor = 1;
  bool isdrawerOpen = false;
/////////////////////////////////////-CoreDevData->>---Do not delete or remove items--->
  var coreDevelopers = [
    "Ashutosh \n  Krishna",
    " Saurav \n Kumar",
    "  Ayush \n  Singh"
  ];
  var imgAssetUrlPrefix = "assets/images/coreDev/";
  var imgAssetFileName = [
    "AshutoshKrishna.jpg",
    "SauravKumar.jpg",
    "AyushSingh.jpeg"
  ];

  var coreDevLinkedinLink = [
  "https://www.linkedin.com/in/ashutoshkrris/",
  "https://www.linkedin.com/in/saurav0001kumar/",
  "https://www.linkedin.com/in/ayush-singh-5823a5180/"
  ];

  var coreDevGithubLink = [
    "https://github.com/ashutoshkrris",
    "https://github.com/saurav0001kumar",
    "https://github.com/ayush-670"
  ];

////////////////////////////////////-->>---Do not delete or remove items--->-Ends here->
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 15, 0, 0),
                    child: Text(
                      'Developer Credits !',
                      style: TextStyle(
                        fontFamily: 'productSans',
                        fontSize: 35.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[750],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 3, 0, 10),
                    child: Text(
                      '@dscnsec-App',
                      style: TextStyle(
                        fontFamily: 'productSans',
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue,
                      ),
                    ),
                  ),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 18),
                      child: Text(
                        'Core Developers',
                        style: TextStyle(
                          fontFamily: 'productSans',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 3; i++)
                        Row(
                          children: [
                            SlimyCard(
                              color: Colors.blueAccent,
                              width: 100,
                              topCardHeight: 180,
                              bottomCardHeight: 100,
                              borderRadius: 15,
                              topCardWidget: topCardWidget(
                                  "$imgAssetUrlPrefix${imgAssetFileName[i]}",
                                  coreDevelopers[i]),
                              bottomCardWidget: bottomCardWidget(i),
                              slimeEnabled: true,
                            ),
                            if (i != 2)
                              SizedBox(
                                width: 7,
                              )
                          ],
                        ),
                    ],
                  ),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 30, 0, 10),
                      child: Text(
                        'Want to contribute?',
                        style: TextStyle(
                          fontFamily: 'productSans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 5),
                      child: Text(
                        'Contribute to us at :',
                        style: TextStyle(
                          fontFamily: 'productSans',
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueGrey,
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 10),
                      child: GestureDetector(
                        onTap: (){_launchAnyURL("https://github.com/dscnsec/DSC-NSEC-App");},
                        child: Chip(
                          backgroundColor: Colors.blue[50],
                          label: Text(
                            'https://github.com/dscnsec/DSC-NSEC-App',
                            style: TextStyle(
                              fontFamily: 'productSans',
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 15),
                      child: Text(
                        'Our Contributors',
                        style: TextStyle(
                          fontFamily: 'productSans',
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.indigo,
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Text(
                        'No folks here yet.',
                        style: TextStyle(
                          fontFamily: 'productSans',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.blueGrey,
                        ),
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

  // This widget will be passed as Top Card's Widget.
  Widget topCardWidget(
    String imagePath,
    devName,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            image: DecorationImage(image: AssetImage(imagePath)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Text(
          devName,
          style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: "productSans",
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  // This widget will be passed as Bottom Card's Widget.
  Widget bottomCardWidget(int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          child: CircleAvatar(
            radius: 18,
              backgroundColor: Colors.white,
              child: Icon(
                FontAwesomeIcons.linkedinIn,
                color: Colors.blue,
              )),
          onTap: (){_launchAnyURL(coreDevLinkedinLink[index]);},
        ),
        SizedBox(
          width: 1,
        ),
        GestureDetector(
          child: CircleAvatar(
            radius: 18,
              backgroundColor: Colors.white,
              child: Icon(
                FontAwesomeIcons.github,
                color: Colors.black87,
              )),
          onTap: (){_launchAnyURL(coreDevGithubLink[index]);},
        ),
      ],
    );
  }

  //Any URL Launcher
  _launchAnyURL(var getUrl) async {
    var url = getUrl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
