import 'dart:convert';

import 'package:dscnsec_app/screens/app_info/app_info_Data.dart';
import 'package:dscnsec_app/screens/teams/teams_data/Team_Data_Holder.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class appInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return appInfoPageState();
  }
}

class appInfoPageState extends State<appInfoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 110,
                ),
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 90,
                    child: ClipOval(child: dsclogo()),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 0, right: 12.0, top: 0.0, bottom: 5),
                  child: Center(
                    child: Text(
                      "DSC NSEC App",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'productSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 5, right: 5, top: 0.0, bottom: 5),
                  child: Center(
                    child: Text(
                      "This is an official android application of Developer Student Clubs (DSC) of\nNetaji Subhash Engineering College, Kolkata, India.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'productSans',
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 0, right: 12.0, top: 0.0, bottom: 20),
                  child: Center(
                    child: Text(
                      "Copyright © 2020 DSC NSEC",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'productSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.blue[600],
                      ),
                    ),
                  ),
                ),
                for (int i = 0; i < 3; i++)
                  Padding(
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 0, bottom: 15),
                    child: Center(
                      child: Text(
                        "${paragraph[i]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'productSans',
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.blueGrey[500],
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(
                      left: 0, right: 12.0, top: 15, bottom: 25),
                  child: Center(
                    child: OutlineButton(
                      onPressed: () {
                        _launchAnyURL(
                            "https://github.com/dscnsec/DSC-NSEC-App/blob/master/LICENSE");
                      },
                      child: Text(
                        "View Full LICENSE",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'productSans',
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.blue[600],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
////////////////////////////////////////////////////////////////////////////////--sticky header-->
          Column(
            children: [
              Card(
                elevation: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 2, top: 5),
                      child: Container(
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.black87,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "DSC NSEC",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'productSans',
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(right: 12.0, top: 5.0, bottom: 5),
                      child: CircleAvatar(
                        radius: 29.0,
                        child: dsclogo(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 0, right: 12.0, top: 0.0, bottom: 5),
                child: Center(
                  child: Chip(
                    backgroundColor: Colors.blue[50],
                    label: Text(
                      " App Information ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'productSans',
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }

  // DSC NSEC LOGO
  Widget dsclogo() {
    var assetImage = AssetImage("assets/images/dsclogo.png");
    var image = Image(
      image: assetImage,
      height: 500,
      width: 500,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(0),
    );
  }

  //Any URL Launcher
  _launchAnyURL(var getUrl) async {
    var url = getUrl;
    if (await canLaunch(url)) {
      await launch(
        url,
        forceWebView: true,
        enableJavaScript: true,
        enableDomStorage: true,
          forceSafariVC: true,
        universalLinksOnly: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
