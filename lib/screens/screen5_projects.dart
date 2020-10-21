import 'dart:convert';
import 'dart:io';

import 'package:dscnsec_app/screens/project_details/projectFullDetails.dart';
import 'package:dscnsec_app/screens/project_details/projectsData.dart';
import 'package:dscnsec_app/screens/screen1_home.dart';
import 'package:dscnsec_app/screens/screen2_events.dart';
import 'package:dscnsec_app/screens/screen3_teams.dart';
import 'package:dscnsec_app/screens/screen4_about.dart';
import 'package:flutter/material.dart';
import '../Drawer/drawer.dart';
import '../customIcons.dart';
import './introText.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

TextofIntro text = TextofIntro();

//Projects Data REST api -- Starts here -->

Future<Album> fetchAlbum() async {
  final response =
      await http.get('https://www.attendanceapp.ml/dsc_testing/projects.json');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load project data');
  }
}

//Data Holder
class Album {
  final List<dynamic> pro_id;

  final List<dynamic> pro_name;

  final List<dynamic> pro_desc;

  final List<dynamic> pro_individual;

  final List<dynamic> pro_dev_name;

  final List<dynamic> pro_dev_dp;

  final List<dynamic> pro_tools;

  final List<dynamic> pro_github;

  final List<dynamic> pro_website;

  final List<dynamic> pro_note;

  final List<dynamic> pro_banner;

  Album({
    this.pro_id,
    this.pro_name,
    this.pro_desc,
    this.pro_individual,
    this.pro_dev_name,
    this.pro_dev_dp,
    this.pro_tools,
    this.pro_github,
    this.pro_website,
    this.pro_note,
    this.pro_banner,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      pro_id: json['pro_id'],
      pro_name: json['pro_name'],
      pro_desc: json['pro_desc'],
      pro_individual: json['pro_individual'],
      pro_dev_name: json['pro_dev_name'],
      pro_dev_dp: json['pro_dev_dp'],
      pro_tools: json['pro_tools'],
      pro_github: json['pro_github'],
      pro_website: json['pro_website'],
      pro_note: json['pro_note'],
      pro_banner: json['pro_banner'],
    );
  }
}
// --> Ends API here <--

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  //
  Future<Album> futureAlbum;

  //
  double xOffset = 0.0;
  double yOffset = 0.0;
  double scalefactor = 1;
  bool isdrawerOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureAlbum = fetchAlbum();

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

                  //YOUR CODE GOES HERE ->> DSC NSEC Porject SECTION ->

                  Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 20.0, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Project Showcase !',
                          style: TextStyle(
                            fontFamily: 'productSans',
                            fontSize: 35.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[800],
                          ),
                        ),
                        Text(
                          '@dscnsec',
                          style: TextStyle(
                            fontFamily: 'productSans',
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),

                  //All the PROJECT cards will be here ->>
                  Container(padding: EdgeInsets.only(top:10),),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                    color: Colors.amberAccent[100],
                    child: Container(
                      child: FutureBuilder<Album>(
                        future: futureAlbum,
                        builder: (BuildContext context, snapshot) {
                          if (snapshot.hasData) {
                            contains_data = true;
                            pro_id = snapshot.data.pro_id;
                            pro_name = snapshot.data.pro_name;
                            pro_desc = snapshot.data.pro_desc;
                            pro_dev_name = snapshot.data.pro_dev_name;
                            pro_dev_dp = snapshot.data.pro_dev_dp;
                            pro_tools = snapshot.data.pro_tools;
                            pro_github = snapshot.data.pro_github;
                            pro_website = snapshot.data.pro_website;
                            pro_note = snapshot.data.pro_note;
                            pro_banner = snapshot.data.pro_banner;

                            return Column(children: [
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: SingleChildScrollView(
                                  padding: EdgeInsets.only(bottom: 20.0),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: <Widget>[
                                      for (int i = pro_id.length-1; i >=0; i--)
                                        ProjectCard(
                                            '${pro_banner[i]}',
                                            '${pro_name[i]}',
                                            '${pro_dev_name[i]}',
                                            i),
                                    ],
                                  ),
                                ),
                              ),
                            ]);
                          } else if (snapshot.hasError) {
                            debugPrint("${snapshot.error}");
                            if (contains_data == false)
                              return Column(
                                children: [
                                  //Custom Default Card
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: SingleChildScrollView(
                                      padding: EdgeInsets.only(bottom: 25.0),
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 15.0,
                                                right: 25.0,
                                                top: 20.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                color: Colors.white,
                                                boxShadow: [
                                                  new BoxShadow(
                                                    color: Colors.grey,
                                                    offset:
                                                        new Offset(15.0, 5.0),
                                                    blurRadius: 10.0,
                                                  )
                                                ],
                                              ),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Column(
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 10.0),
                                                      child: Container(
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            (1.0 / 2.55),
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.65,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      4.0),
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  "assets/images/no_image.jpeg"),
                                                              fit:
                                                                  BoxFit.cover),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4.0),
                                                        color: Colors.grey[200],
                                                      ),
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              (0.06),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.65,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Container(
                                                            color: Colors.blue,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.06,
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              '...',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'productSans',
                                                                  fontSize:
                                                                      18.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // <- Custom Default Card Ends ->

                                  Container(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                      child: Center(
                                          child: Text(
                                        "Unable to load Projects.",
                                        style: TextStyle(
                                          color: Colors.amber.shade600,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          fontFamily: 'productSans',
                                        ),
                                      ))),
                                  Container(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                                      child: Center(
                                          child: FlatButton.icon(
                                              onPressed: () {
                                                setState(() {
                                                  futureAlbum = fetchAlbum();
                                                  FutureBuilder<Album>(
                                                      future: futureAlbum,
                                                      builder:
                                                          (BuildContext context,
                                                              snapshot) {
                                                        if (snapshot.hasData) {
                                                          setState(() {
                                                            pro_id = snapshot
                                                                .data.pro_id;
                                                            pro_name = snapshot
                                                                .data.pro_name;
                                                            pro_desc = snapshot
                                                                .data.pro_desc;
                                                            pro_dev_name =
                                                                snapshot.data
                                                                    .pro_dev_name;
                                                            pro_dev_dp =
                                                                snapshot.data
                                                                    .pro_dev_dp;
                                                            pro_tools = snapshot
                                                                .data.pro_tools;
                                                            pro_github =
                                                                snapshot.data
                                                                    .pro_github;
                                                            pro_website =
                                                                snapshot.data
                                                                    .pro_website;
                                                            pro_note = snapshot
                                                                .data.pro_note;
                                                            pro_banner =
                                                                snapshot.data
                                                                    .pro_banner;
                                                          });
                                                        }
                                                      });
                                                });
                                              },
                                              icon: Icon(
                                                Icons.refresh,
                                                color: Colors.blue,
                                              ),
                                              label: Text(
                                                "Reload",
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontFamily: 'productSans',
                                                ),
                                              ))))
                                ],
                              );
                            else
                              return Column(children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child: SingleChildScrollView(
                                    padding: EdgeInsets.only(bottom: 25.0),
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: <Widget>[
                                        for (int i = pro_id.length-1; i >=0; i--)
                                          ProjectCard(
                                              '${pro_banner[i]}',
                                              '${pro_name[i]}',
                                              '${pro_dev_name[i]}',
                                              i),
                                      ],
                                    ),
                                  ),
                                ),
                              ]);
                          }

                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 5.0),
                                child: SingleChildScrollView(
                                  padding: EdgeInsets.only(bottom: 25.0),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: <Widget>[
                                      for (int i = 0; i < 2; i++)
                                        TransitionProjectCard(
                                          'assets/images/loading2.gif',
                                          'Please Wait...',
                                          'Getting developer info...',
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  //////////
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
}

//
class ProjectCard extends StatelessWidget {
  final String img;
  final String title;
  final String name;
  final int card_index;

  ProjectCard(this.img, this.title, this.name, this.card_index);

  @override
  Widget build(BuildContext context) {
    //the card....
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 5.0, top: 15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
              color: Colors.black45,
              offset: new Offset(15.0, 5.0),
              blurRadius: 20.0,
            )
          ],
        ),
        height: MediaQuery.of(context).size.height * 0.7, //
        width: MediaQuery.of(context).size.width * 0.8, //
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Container(
                  child: FadeInImage.assetNetwork(
                    fadeInCurve: Curves.easeInOutCubic,
                    fadeInDuration: const Duration(seconds: 2),
                    placeholder: 'assets/images/loading2.gif',
                    image: img,
                    fit: BoxFit.fill,
                  ),
                  height: MediaQuery.of(context).size.height * (0.5 / 1.25), //
                  width: MediaQuery.of(context).size.width * 0.75, //
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.grey[200],
                ),
                height: MediaQuery.of(context).size.height * (0.5 / 1.9), //
                width: MediaQuery.of(context).size.width * 0.75, //
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        left: 12.0,
                        right: 10.0,
                        top: 10.0,
                      ),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'productSans',
                          fontSize: 22.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        dateVenue(Icons.developer_mode, name, 0.0),
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          debugPrint("PRESSED Card No.-${card_index}");
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      projectFullDetails(card_index)));
                        },
                        child: Container(
                          color: Colors.blue,
                          height: MediaQuery.of(context).size.height * 0.06,
                          alignment: Alignment.center,
                          child: Text(
                            'Explore Project',
                            style: TextStyle(
                                fontFamily: 'productSans',
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget dateVenue(IconData icon, String value, double botPadd) {
  return Padding(
    padding: EdgeInsets.only(left: 10.0, bottom: botPadd),
    child: Row(
      children: <Widget>[
        Icon(icon, color: Colors.blue),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            value,
            style: TextStyle(
              fontFamily: 'productSans',
              fontSize: 18.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    ),
  );
}

//Transition Project Card ->>
class TransitionProjectCard extends StatelessWidget {
  final String img;
  final String title;
  final String name;

  TransitionProjectCard(this.img, this.title, this.name);

  @override
  Widget build(BuildContext context) {
    //the card....
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 5.0, top: 15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
              color: Colors.grey,
              offset: new Offset(15.0, 5.0),
              blurRadius: 20.0,
            )
          ],
        ),
        height: MediaQuery.of(context).size.height * 0.7, //
        width: MediaQuery.of(context).size.width * 0.8, //
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * (0.5 / 1.25), //
                  width: MediaQuery.of(context).size.width * 0.75, //
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: DecorationImage(
                        image: AssetImage(img), fit: BoxFit.cover),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.grey[200],
                ),
                height: MediaQuery.of(context).size.height * (0.5 / 1.9),
                width: MediaQuery.of(context).size.width * 0.75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        left: 12.0,
                        right: 10.0,
                        top: 10.0,
                      ),
                      child: Text(
                        title,
                        style: TextStyle(
                          fontFamily: 'productSans',
                          fontSize: 22.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        dateVenue(Icons.assistant_outlined, name, 10.0),
                      ],
                    ),
                    Container(
                      color: Colors.blue,
                      height: MediaQuery.of(context).size.height * 0.06,
                      alignment: Alignment.center,
                      child: Text(
                        '...',
                        style: TextStyle(
                            fontFamily: 'productSans',
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
