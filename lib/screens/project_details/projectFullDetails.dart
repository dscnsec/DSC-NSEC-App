import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dscnsec_app/Drawer/drawer.dart';
import 'package:dscnsec_app/screens/project_details/projectFullDetails.dart';
import 'package:dscnsec_app/screens/screen1_home.dart';
import 'package:dscnsec_app/screens/screen2_events.dart';
import 'package:dscnsec_app/screens/screen3_teams.dart';
import 'package:dscnsec_app/screens/screen4_about.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../customIcons.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../introText.dart';
import '../screen5_projects.dart';
import '../screen5_projects.dart';
import 'projectsData.dart';
import 'projectsData.dart';
import 'projectsData.dart';
import 'projectsData.dart';
import 'projectsData.dart';
import 'projectsData.dart';
import 'projectsData.dart';
import 'projectsData.dart';
import 'projectsData.dart';
import 'projectsData.dart';
import 'projectsData.dart';
import 'projectsData.dart';
import 'projectsData.dart';
import 'projectsData.dart';
import 'projectsData.dart';
import 'projectsData.dart';
import 'projectsData.dart';
import 'projectsData.dart';
import 'projectsData.dart';
import 'projectsData.dart';
import 'projectsData.dart';

TextofIntro text = TextofIntro();

class projectFullDetails extends StatefulWidget {
  var card_index;

  projectFullDetails(this.card_index);

  @override
  projectFullDetailsState createState() =>
      projectFullDetailsState(this.card_index);
}

class projectFullDetailsState extends State<projectFullDetails> {
  double xOffset = 0.0;
  double yOffset = 0.0;
  double scalefactor = 1;
  bool isdrawerOpen = false;

  var card_index;
  var tools; //tools and technologies list
  var developers; //project devleopers list (if done by a team)

  projectFullDetailsState(this.card_index);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //spliting the data
    tools = pro_tools[card_index].toString().split(",");
    if (pro_tools[card_index].toString().contains(","))
      developers = pro_dev_name[card_index].toString().split(",");
    else
      developers=[pro_dev_name[card_index].toString()];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
            body: SafeArea(
                child: Stack(children: <Widget>[
                  DrawerScreen(),
                  AnimatedContainer(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          isdrawerOpen ? 35.0 : 0.0),
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
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .height *
                                                0.3;
                                        yOffset =
                                            MediaQuery
                                                .of(context)
                                                .size
                                                .width *
                                                0.37;
                                        scalefactor = 0.6;
                                        isdrawerOpen = true;
                                      });
                                    }),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: MediaQuery
                                          .of(context)
                                          .size
                                          .width * 0.06),
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
                                  padding: EdgeInsets.only(
                                      right: 12.0, top: 5.0),
                                  child: CircleAvatar(
                                    radius: 29.0,
                                    child: dsclogo(),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //YOUR CODE GOES HERE ->> DSC NSEC Porject FULL Details SECTION ->

                          Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //Project name
                                Center(
                                    child: Container(
                                        padding: EdgeInsets.fromLTRB(
                                            15, 10, 15, 15),
                                        child: TypewriterAnimatedTextKit(
                                          speed: Duration(milliseconds: 200),
                                          repeatForever: false,
                                          isRepeatingAnimation: true,
                                          onTap: () {
                                            print("Tap Event");
                                          },
                                          text: [
                                            "${pro_name[card_index]} !",
                                          ],
                                          textStyle: TextStyle(
                                              fontFamily: 'productSans',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 27.0,
                                              color: Colors.indigo),
                                          textAlign: TextAlign.start,
                                          alignment: AlignmentDirectional
                                              .topStart,
                                        ))),
                              ]),

                          //project banner
                          Center(
                              child: Padding(
                                  padding:
                                  EdgeInsets.symmetric(horizontal: 0,
                                      vertical: 0),
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3, vertical: 3),
                                      height: 350,
                                      width: 350,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            10.0),
                                        color: Colors.amber,
                                        boxShadow: [
                                          new BoxShadow(
                                            color: Colors.white,
                                            offset: new Offset(15.0, 5.0),
                                            blurRadius: 20.0,
                                          )
                                        ],
                                      ),
                                      child: Card(
                                        elevation: 5,
                                        child: FadeInImage.assetNetwork(
                                          fadeInCurve: Curves.easeInOutCubic,
                                          fadeInDuration: const Duration(
                                              seconds: 1),
                                          placeholder: 'assets/images/loading2.gif',
                                          image: pro_banner[card_index],
                                          fit: BoxFit.fill,
                                        ),
                                      )))),

                          //project description
                          Center(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(18, 20, 18, 2),
                              child: Text(
                                "About Project",
                                style: TextStyle(
                                    fontSize: 23,
                                    fontFamily: 'productSans',
                                    color: Colors.grey[600]),
                              ),
                            ),
                          ),

                          Container(
                            padding: EdgeInsets.fromLTRB(18, 5, 18, 15),
                            child: Text(
                              "${pro_desc[card_index]}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'productSans',
                                  color: Colors.blue),
                            ),
                          ),

                          //project tools used

                          Center(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(5, 15, 5, 5),
                              child: Text(
                                "Tools & Technologies Used",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: 'productSans',
                                    color: Colors.grey[600]),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 2),
                              child: Icon(Icons.settings,
                                color: Colors.lightBlue, size: 50,),),
                          ),
                          if (pro_tools[card_index] != "" && tools != null)
                            for (int i = 0; i < tools.length; i++)
                              Center(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  child: Chip(
                                    backgroundColor: Colors.tealAccent[100],
                                    label: Text(
                                      "${tools[i]}",
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: 'productSans',
                                          color: Colors.tealAccent[500]),
                                    ),
                                  ),
                                ),
                              ),
                          //github link
                          Center(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(5, 25, 5, 0),
                              child: Text(
                                "GitHub Repository Link",
                                style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: 'productSans',
                                    color: Colors.grey[600]),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Image(
                                image: AssetImage("assets/images/github.png"),
                                height: 50,
                                width: 50,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: _launchGithubURL,
                            onDoubleTap: _launchGithubURL,
                            onLongPress: _launchGithubURL,
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: Chip(
                                  elevation: 1,
                                  backgroundColor: Colors.grey[200],
                                  label: Text(
                                    "${pro_github[card_index]}",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'productSans',
                                        color: Colors.blueAccent[400]),
                                  ),
                                ),
                              ),
                            ),
                          ),


                          //project website (if any)
                          if(pro_website[card_index] != "")
                            Center(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(5, 25, 5, 0),
                                child: Text(
                                  "Project Website",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'productSans',
                                      color: Colors.grey[600]),
                                ),
                              ),
                            ),
                          if(pro_website[card_index] != "")
                            Center(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                child: Icon(
                                  Icons.language, color: Colors.lightBlue,
                                  size: 50,),),
                            ),
                          if(pro_website[card_index] != "")
                            GestureDetector(
                              onTap: _launchWebsite,
                              onDoubleTap: _launchWebsite,
                              onLongPress: _launchWebsite,
                              child: Center(
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  child: Chip(
                                    elevation: 1,
                                    backgroundColor: Colors.grey[200],
                                    label: Text(
                                      "${pro_website[card_index]}",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'productSans',
                                          color: Colors.blueAccent[400]),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                          //project done by
                          if(pro_dev_name[card_index] != "")
                            Center(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(5, 25, 5, 5),
                                child: Text(
                                  "Project By,",
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'productSans',
                                      color: Colors.grey[600]),
                                ),
                              ),
                            ),
                          if(pro_dev_name[card_index] != "" && pro_individual[card_index].toString().toLowerCase()=="yes" )
                            Padding(
                              padding: const EdgeInsets.only(bottom:25.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                    CircleAvatar(
                                      backgroundColor: Colors.purple[100],
                                      child: Text("${pro_dev_name[card_index].toString().substring(0,1).toUpperCase()}",
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontFamily: 'productSans',
                                            color: Colors.purple),
                                      ),),
                                    Chip(
                                      backgroundColor: Colors.purple[50],
                                      label: Text("${pro_dev_name[card_index]}",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontFamily: 'productSans',
                                            color: Colors.purple),
                                      ),
                                    )
                                  ],)
                                ],
                              ),
                            ),

                          if(pro_dev_name[card_index] != "" && pro_individual[card_index].toString().toLowerCase()=="no" )
                            for(int i=0; i<developers.length; i++)
                            Padding(
                              padding: const EdgeInsets.only(bottom:0.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.purple[100],
                                        child: Text("${pro_dev_name[card_index].toString().substring(0,1).toUpperCase()}",
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontFamily: 'productSans',
                                              color: Colors.purple),
                                        ),),
                                      Chip(
                                        backgroundColor: Colors.purple[50],
                                        label: Text("${pro_dev_name[card_index]}",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: 'productSans',
                                              color: Colors.purple),
                                        ),
                                      )
                                    ],)
                                ],
                              ),
                            ),
                          if(pro_dev_name[card_index] != "" && pro_individual[card_index].toString().toLowerCase()=="no" )
                            Padding(padding: EdgeInsets.only(bottom: 25)),
                            


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
        builder: (context) =>
            AlertDialog(
              title: Center(
                child: Text(
                  "Return to Projects Section ?",
                  style: TextStyle(fontFamily: "productSans"),
                ),
              ),
              actions: [
                Container(
                  padding: EdgeInsets.only(bottom: 15),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: FlatButton.icon(
                            onPressed: () =>
                                Navigator.of(context)
                                    .pushReplacement(MaterialPageRoute(
                                    builder: (context) => ProjectPage())),
                            icon: Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                            label: Text(
                              "Return",
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
                  ],
                )
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

  //launch github URl for projects
  _launchGithubURL() async {
    var url = "${pro_github[card_index]}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchWebsite() async {
    var url = "${pro_website[card_index]}";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
