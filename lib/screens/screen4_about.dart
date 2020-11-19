import 'dart:io';

import 'package:dscnsec_app/Drawer/drawer.dart';
import 'package:dscnsec_app/screens/screen1_home.dart';
import 'package:dscnsec_app/screens/screen2_events.dart';
import 'package:dscnsec_app/screens/screen3_teams.dart';
import 'package:dscnsec_app/screens/screen5_projects.dart';
import 'package:dscnsec_app/screens/screen6_developerCredits.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../customIcons.dart';
import 'introText.dart';

TextofIntro text = TextofIntro();

class about extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return aboutState();
  }
}

class aboutState extends State<about> {
  double xOffset = 0.0;
  double yOffset = 0.0;
  double scalefactor = 1;
  bool isdrawerOpen = false;

  // Code of Conduct: AntiHarassment Policy (AHP) Pointwise Answers only
  var ahpQ1points = [
    "It sets expectations for behavior at the event. Simply having an anti-harassment policy can prevent harassment.",
    "It encourages people to attend who have had bad experiences at other events",
    "It gives event staff/volunteers instructions on how to handle harassment quickly, with minimum amount of disruption for the event."
  ];

  var Q2points = [
    "Gender",
    "Sexual Orientation",
    "Disabilty",
    "Gender Identity",
    "Age",
    "Race",
    "Religion",
    "Nationality"
  ];

  var Q3points=[
    "Offensive verbal comments related to gender, sexual orientation, disability, gender identity, age, race, religion",
    "The use or display of sexual images in public spaces",
    "Deliberate intimidation",
    "Stalking",
    "Harassing photography or recording",
    "Sustained disruption of talks or other events",
    "Inappropriate physical contact",
    "Unwelcome sexual attention"
  ];

  //

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
                    padding: EdgeInsets.only(top: 15.0, left: 20.0, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'About',
                          style: TextStyle(
                            fontFamily: 'productSans',
                            fontSize: 35.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[800],
                          ),
                        ),
                        Text(
                          'Developer Students Club',
                          style: TextStyle(
                            fontFamily: 'productSans',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        ),

                        //About-Page main image banner
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 15, 2, 20),
                            child: aboutPageMainBanner()),

                        //About main intro text
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: Text(
                            about_main_text,
                            style: TextStyle(
                              fontFamily: 'productSans',
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),

                        //Buttons

                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 30),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.grey[300],
                                      offset: new Offset(5.0, 2.0),
                                      blurRadius: 15.0,
                                    )
                                  ],
                                ),
                                child: FlatButton(
                                  onPressed: _openURL,
                                  color: Colors.blue[500],
                                  padding: EdgeInsets.all(15.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Text(
                                    'Find a DSC near You',
                                    style: TextStyle(
                                      fontFamily: 'productSans',
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0.0, vertical: 25),
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    new BoxShadow(
                                      color: Colors.grey[100],
                                      offset: new Offset(5.0, 2.0),
                                      blurRadius: 15.0,
                                    )
                                  ],
                                ),
                                child: OutlineButton(
                                  onPressed: _leadDSC_URL,
                                  color: Colors.white,
                                  padding: EdgeInsets.all(15.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Text(
                                    'Lead a DSC',
                                    style: TextStyle(
                                      fontFamily: 'productSans',
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue[500],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        //DSC Community Guidelines
                        Padding(
                          padding:
                              EdgeInsets.only(top: 25, left: 0, bottom: 20),
                          child: Text(
                            'DSC Community Guidelines . . </>',
                            style: TextStyle(
                              fontFamily: 'productSans',
                              fontSize: 32.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: ExpandablePanel(
                            header: Text(
                              h1,
                              style: TextStyle(
                                fontFamily: 'productSans',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.indigo,
                              ),
                            ),
                            expanded: Padding(
                              padding: EdgeInsets.only(bottom: 15.0),
                              child: Text(
                                expand1,
                                softWrap: true,
                                style: TextStyle(
                                  fontFamily: 'productSans',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            tapHeaderToExpand: true,
                            hasIcon: true,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: ExpandablePanel(
                            header: Padding(
                              padding: EdgeInsets.only(bottom: 15.0),
                              child: Text(
                                h2,
                                style: TextStyle(
                                  fontFamily: 'productSans',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.indigo,
                                ),
                              ),
                            ),
                            expanded: Padding(
                              padding: EdgeInsets.only(bottom: 15.0),
                              child: Text(
                                expand2,
                                softWrap: true,
                                style: TextStyle(
                                  fontFamily: 'productSans',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            tapHeaderToExpand: true,
                            hasIcon: true,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: ExpandablePanel(
                            header: Text(
                              h3,
                              style: TextStyle(
                                fontFamily: 'productSans',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.indigo,
                              ),
                            ),
                            expanded: Padding(
                              padding: EdgeInsets.only(bottom: 15.0),
                              child: Text(
                                expand3,
                                softWrap: true,
                                style: TextStyle(
                                  fontFamily: 'productSans',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            tapHeaderToExpand: true,
                            hasIcon: true,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: ExpandablePanel(
                            header: Text(
                              h4,
                              style: TextStyle(
                                fontFamily: 'productSans',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.indigo,
                              ),
                            ),
                            expanded: Padding(
                              padding: EdgeInsets.only(bottom: 15.0),
                              child: Text(
                                expand4,
                                softWrap: true,
                                style: TextStyle(
                                  fontFamily: 'productSans',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            tapHeaderToExpand: true,
                            hasIcon: true,
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: ExpandablePanel(
                            header: Padding(
                              padding: EdgeInsets.only(bottom: 15.0),
                              child: Text(
                                h5,
                                style: TextStyle(
                                  fontFamily: 'productSans',
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.indigo,
                                ),
                              ),
                            ),
                            expanded: Padding(
                              padding: EdgeInsets.only(bottom: 15.0),
                              child: Text(
                                expand5,
                                softWrap: true,
                                style: TextStyle(
                                  fontFamily: 'productSans',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            tapHeaderToExpand: true,
                            hasIcon: true,
                          ),
                        ),

                        //Code of Conduct
                        Padding(
                          padding:
                              EdgeInsets.only(top: 30, left: 0, bottom: 20),
                          child: Text(
                            'Code of Conduct',
                            style: TextStyle(
                              fontFamily: 'productSans',
                              fontSize: 33.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 0, bottom: 20, right: 20),
                          child: Text(
                            'AntiHarassment Policy',
                            style: TextStyle(
                              fontFamily: 'productSans',
                              fontSize: 27.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                              top: 0, left: 0, bottom: 20, right: 20),
                          child: Text(
                            'Why do we have an official Anti-Harassment policy for Developer Student Clubs NSEC events?',
                            style: TextStyle(
                              fontFamily: 'productSans',
                              fontSize: 22.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.amber[600],
                            ),
                          ),
                        ),

                        Padding(
                            padding: EdgeInsets.only(
                                top: 0, left: 0, bottom: 10, right: 20),
                            child: ListTile(
                              leading: Icon(
                                Icons.chevron_right,
                                size: 25,
                                color: Colors.purple,
                              ),
                              title: Text(
                                ahpQ1points[0],
                                style: TextStyle(
                                  fontFamily: 'productSans',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            )),

                        Padding(
                            padding: EdgeInsets.only(
                                top: 0, left: 0, bottom: 10, right: 20),
                            child: ListTile(
                              leading: Icon(
                                Icons.chevron_right,
                                size: 25,
                                color: Colors.purple,
                              ),
                              title: Text(
                                ahpQ1points[1],
                                style: TextStyle(
                                  fontFamily: 'productSans',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            )),

                        Padding(
                            padding: EdgeInsets.only(
                                top: 0, left: 0, bottom: 20, right: 20),
                            child: ListTile(
                              leading: Icon(
                                Icons.chevron_right,
                                size: 25,
                                color: Colors.purple,
                              ),
                              title: Text(
                                ahpQ1points[2],
                                style: TextStyle(
                                  fontFamily: 'productSans',
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            )),

                        Padding(
                          padding: EdgeInsets.only(
                              top: 15, left: 0, bottom: 20, right: 20),
                          child: Text(
                            'Developer Student Clubs NSEC is dedicated to providing a harassment-free event experience for everyone, regardless of:',
                            style: TextStyle(
                              fontFamily: 'productSans',
                              fontSize: 26.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        for (int i = 0; i < Q2points.length; i++)
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 0, left: 10, bottom: 5, right: 20),
                                child: Icon(Icons.brightness_1,size: 10,color: Colors.purple,)
                              ),

                              Padding(
                                padding: EdgeInsets.only(
                                    top: 0, left: 0, bottom: 5, right: 20),
                                child: Text(
                                  Q2points[i],
                                  style: TextStyle(
                                    fontFamily: 'productSans',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.indigo,
                                  ),
                                ),
                              ),
                            ],
                          ),

                        Padding(
                          padding: EdgeInsets.only(
                              top: 7, left: 5, bottom: 5, right: 20),
                          child: Text(
                            "The above is not an exhaustive list -- we do not tolerate harassment of event spanarticipants in any form.",
                            style: TextStyle(
                              fontFamily: 'productSans',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                              top: 7, left: 5, bottom: 5, right: 20),
                          child: Text(
                            "Sexual language and imagery is not appropriate for any event venue, including talks. Event participants violating these rules may be expelled from the event, and event banned from future events at the discretion of the event organizers/management.",
                            style: TextStyle(
                              fontFamily: 'productSans',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                              top: 10, left: 5, bottom: 10, right: 20),
                          child: Text(
                            "Harassment includes (but is not limited to):",
                            style: TextStyle(
                              fontFamily: 'productSans',
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                        ),

                        for (int i = 0; i < Q3points.length; i++)
                          Padding(
                              padding: EdgeInsets.only(
                                  top: 0, left: 0, bottom: 0, right: 20),
                              child: ListTile(
                                leading: Icon(
                                  Icons.chevron_right,
                                  size: 25,
                                  color: Colors.purple,
                                ),
                                title: Text(
                                  Q3points[i],
                                  style: TextStyle(
                                    fontFamily: 'productSans',
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              )),

                        Padding(
                          padding: EdgeInsets.only(
                              top: 10, left: 5, bottom: 5, right: 20),
                          child: Text(
                            "Participants asked to stop any harassing behavior are expected to comply immediately.",
                            style: TextStyle(
                              fontFamily: 'productSans',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                              top: 10, left: 5, bottom: 5, right: 20),
                          child: Text(
                            "Exhibiting partners and guests are also subject to the anti-harassment policy. In particular, exhibitors and speakers should not use sexualized images, activities, or other material, or otherwise create a sexualized environment in their slide decks, exhibit material, exhibit staffing, promotional items or demo material.",
                            style: TextStyle(
                              fontFamily: 'productSans',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                              top: 10, left: 5, bottom: 5, right: 20),
                          child: Text(
                            "If you are being harassed, notice that someone else is being harassed, or have any other concerns, please contact an organizer or event volunteer immediately. Organizers and event volunteers may be identified by t-shirts or special badges/lanyards. Organizers will investigate the issue and take appropriate action. This may include helping participants contact venue security or local law enforcement, provide escorts, or otherwise assist these experiencing harassment to fell safe for the duration of the event.",
                            style: TextStyle(
                              fontFamily: 'productSans',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                              top: 10, left: 5, bottom: 10, right: 20),
                          child: Text(
                            "Though we hope that we never have to invoke this policy, we believe that having this document helps everyone think a little more about how their actions and words affect the whole community, as well as individuals in the community.",
                            style: TextStyle(
                              fontFamily: 'productSans',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),

                        dsclogo(),



                      ],
                    ),
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
                          MaterialPageRoute(builder: (context) => teams())),
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
                          MaterialPageRoute(builder: (context) => about())),
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
                          MaterialPageRoute(
                              builder: (context) => developerCredits())),
                      icon: Icon(
                        Icons.developer_mode,
                        color: Colors.blue,
                      ),
                      label: Text(
                        "Developer\nCredits",
                        style: TextStyle(fontFamily: "productSans"),
                      )),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 15),
                ),
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

  // DSC About Page Main Banner
  Widget aboutPageMainBanner() {
    var assetImage = AssetImage("assets/images/about_main_banner.png");
    var image = Image(
      image: assetImage,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(0),
    );
  }

//Button function to FIND DSC near you
  _openURL() async {
    const url = 'https://dsc.community.dev/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch';
    }
  }

  //Button function for learn More DSC
  _leadDSC_URL() async {
    const url = 'https://developers.google.com/community/dsc/leads';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch';
    }
  }
}
