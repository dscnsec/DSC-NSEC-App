import 'package:dscnsec_app/Drawer/drawer.dart';
import 'package:flutter/material.dart';
import './introText.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:dscnsec_app/customIcons.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'screen2_events.dart';

TextofIntro text = TextofIntro();

//Upcoming Events at Home REST api
Future<Album> fetchAlbum() async {
  final response = await http
      .get('https://www.attendanceapp.ml/dsc_testing/upcoming_events.json');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load up_event data');
  }
}

//Data Holder
class Album {
  final List<dynamic> up_id;
  final List<dynamic> up_name;
  final List<dynamic> up_date;
  final List<dynamic> up_location;
  final List<dynamic> up_banner;

  Album({
    this.up_id,
    this.up_name,
    this.up_date,
    this.up_location,
    this.up_banner,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        up_id: json['up_id'],
        up_name: json['up_name'],
        up_date: json['up_date'],
        up_location: json['up_location'],
        up_banner: json['up_banner']);
  }
}

//Ends API

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //
  Future<Album> futureAlbum;
  var up_id;
  var up_name;
  var up_date;
  var up_location;
  var up_banner;

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
    // Future.delayed(Duration(microseconds: 0),(){
    //   setState(() {
    //     xOffset =
    //         MediaQuery.of(context).size.height * 0.3;
    //     yOffset =
    //         MediaQuery.of(context).size.width * 0.37;
    //     scalefactor = 0.6;
    //     isdrawerOpen = true;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    double heiGht = MediaQuery.of(context).size.height;
    return Scaffold(
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

//DSC NSEC INTRO
              Padding(
                padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 0),
                child: Container(
                  height: heiGht > 700
                      ? MediaQuery.of(context).size.height * 0.85
                      : MediaQuery.of(context).size.height,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      //         boxShadow: [
                      //   new BoxShadow(
                      //     color: Colors.grey,
                      //     offset: new Offset(5.0, 5.0),
                      //     blurRadius: 20.0,
                      //   )
                      // ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: 65.0,
                          left: 5.0,
                        ),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage('assets/images/cover2.jpeg'),
                              ),
                              color: Colors.transparent),
                        ),
                      ),

                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.0, right: 20.0, top: 45.0),
                        child: Text(
                          text.introText,
                          style: TextStyle(
                              fontFamily: 'productSans',
                              fontWeight: FontWeight.w300,
                              fontSize: 22.0,
                              color: Colors.grey[600]),
                        ),
                      ),
                      //Make good things together
                      // Padding(
                      //   padding:
                      //       EdgeInsets.only(top: 35.0, left: 20.0, bottom: 10.0),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: <Widget>[
                      //       Text(
                      //         'Make good things',
                      //         style: TextStyle(
                      //           fontFamily: 'productSans',
                      //           fontSize: 33.0,
                      //           fontWeight: FontWeight.w400,
                      //           color: Colors.grey[600],
                      //         ),
                      //       ),
                      //       Text(
                      //         'Together',
                      //         style: TextStyle(
                      //           fontFamily: 'productSans',
                      //           fontSize: 33.0,
                      //           fontWeight: FontWeight.w700,
                      //           color: Colors.blue,
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 25),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey,
                                offset: new Offset(5.0, 2.0),
                                blurRadius: 15.0,
                              )
                            ],
                          ),
                          child: FlatButton(
                            onPressed: () {},
                            color: Colors.blue[500],
                            padding: EdgeInsets.all(15.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Text(
                              'Become a member',
                              style: TextStyle(
                                fontFamily: 'productSans',
                                fontSize: 20.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 45.0,
                  left: 15.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Featured Events',
                      style: TextStyle(
                        fontFamily: 'productSans',
                        fontSize: 33.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[800],
                      ),
                    ),
                    Text(
                      '& Meetups',
                      style: TextStyle(
                        fontFamily: 'productSans',
                        fontSize: 33.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              //All the FEATURED cards will be here

              Container(
                child: FutureBuilder<Album>(
                  future: futureAlbum,
                  builder: (BuildContext context, snapshot) {
                    if (snapshot.hasData) {
                      up_id = snapshot.data.up_id;
                      up_name = snapshot.data.up_name;
                      up_date= snapshot.data.up_date;
                      up_location=snapshot.data.up_location;
                      up_banner = snapshot.data.up_banner;

                      return Column(children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(bottom: 25.0),
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                for (int i = 0; i < 2; i++)
                                  EventCard('${up_banner[i]}', '${up_name[i]}',
                                      '${up_date[i]}', '${up_location[i]}'),
                              ],
                            ),
                          ),
                        ),
                      ]);
                    } else if (snapshot.hasError) {
                      debugPrint("${snapshot.error}");
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
                                        left: 15.0, right: 25.0, top: 20.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: Colors.white,
                                        boxShadow: [
                                          new BoxShadow(
                                            color: Colors.grey,
                                            offset: new Offset(15.0, 5.0),
                                            blurRadius: 10.0,
                                          )
                                        ],
                                      ),
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.5,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 10.0),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    (0.5 / 2.55),
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.65,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          4.0),
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "assets/images/no_image.png"),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                color: Colors.grey[200],
                                              ),
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  (0.5 / 1.9),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.65,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 12.0,
                                                      right: 10.0,
                                                      top: 10.0,
                                                    ),
                                                    child: Text(
                                                      "...",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'productSans',
                                                        fontSize: 22.0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    children: <Widget>[
                                                      dateVenue(
                                                          FontAwesomeIcons
                                                              .calendarAlt,
                                                          "...",
                                                          10.0),
                                                      dateVenue(
                                                          FontAwesomeIcons
                                                              .mapMarker,
                                                          "...",
                                                          0.0),
                                                    ],
                                                  ),
                                                  Container(
                                                    color: Colors.blue,
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.06,
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      '...',
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'productSans',
                                                          fontSize: 18.0,
                                                          fontWeight:
                                                              FontWeight.w400,
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
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // <- Custom Default Card Ends ->

                          Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Center(
                                  child: Text(
                                "No Internet Connection.",
                                style: TextStyle(
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  fontFamily: 'productSans',
                                ),
                              ))),
                          Container(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Center(
                                  child: Text(
                                "Unable to load Featured Events.",
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
                                              builder: (BuildContext context,
                                                  snapshot) {
                                                if (snapshot.hasData) {
                                                  setState(() {
                                                    up_id = snapshot.data.up_id;
                                                    up_name = snapshot.data.up_name;
                                                    up_date= snapshot.data.up_date;
                                                    up_location=snapshot.data.up_location;
                                                    up_banner = snapshot.data.up_banner;
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
                                  EventCard(
                                      'assets/images/no_image.png',
                                      'Please Wait...',
                                      'Event Loading...',
                                      'Getting location...'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              ////////////////

              Padding(
                padding: EdgeInsets.only(left: 20.0, bottom: 40.0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: RaisedButton(
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => screen2_events()));
                    },
                    color: Colors.blue[500],
                    textColor: Colors.white,
                    child: Text(
                      "Explore all Events",
                      style: TextStyle(
                        fontFamily: 'productSans',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ])));
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

class EventCard extends StatelessWidget {
  final String img;
  final String title;
  final String date;
  final String venue;

  EventCard(this.img, this.title, this.date, this.venue);

  @override
  Widget build(BuildContext context) {
    //the card....
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 20.0, top: 20.0),
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
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.7,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * (0.5 / 2.55),
                  width: MediaQuery.of(context).size.width * 0.65,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    image: DecorationImage(
                        image: NetworkImage(img), fit: BoxFit.cover),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Colors.grey[200],
                ),
                height: MediaQuery.of(context).size.height * (0.5 / 1.9),
                width: MediaQuery.of(context).size.width * 0.65,
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
                        dateVenue(FontAwesomeIcons.calendarAlt, date, 10.0),
                        dateVenue(FontAwesomeIcons.mapMarker, venue, 0.0),
                      ],
                    ),
                    Container(
                      color: Colors.blue,
                      height: MediaQuery.of(context).size.height * 0.06,
                      alignment: Alignment.center,
                      child: Text(
                        'Know More',
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
