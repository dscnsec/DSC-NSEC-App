import 'dart:convert';
import 'dart:io';

import 'package:dscnsec_app/Drawer/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dscnsec_app/customIcons.dart';
import 'dart:math';
import 'event_details/eventFullDetails.dart';
import 'eventsData.dart';
import 'package:http/http.dart' as http;

//Upcoming Events at Events Page REST api --starts here--->>
Future<Album> fetchAlbum() async {
  final response = await http
      .get('https://raw.githubusercontent.com/dscnsec/dscnsec-app-resources/main/api/events_data/upcoming_events.json');

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
  final List<dynamic> up_desc;
  final List<dynamic> up_date;
  final List<dynamic> up_time;
  final List<dynamic> up_mode;
  final List<dynamic> up_location;
  final List<dynamic> up_speakers;
  final List<dynamic> up_prerequire;
  final List<dynamic> up_note;
  final List<dynamic> up_reglink;
  final List<dynamic> up_lastreg;
  final List<dynamic> up_regstatus;
  final List<dynamic> up_banner;

  Album({
    this.up_id,
    this.up_name,
    this.up_desc,
    this.up_date,
    this.up_time,
    this.up_mode,
    this.up_location,
    this.up_speakers,
    this.up_prerequire,
    this.up_note,
    this.up_reglink,
    this.up_lastreg,
    this.up_regstatus,
    this.up_banner,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        up_id: json['up_id'],
        up_name: json['up_name'],
        up_desc: json['up_desc'],
        up_date: json['up_date'],
        up_time: json['up_time'],
        up_mode: json['up_mode'],
        up_location: json['up_location'],
        up_speakers: json['up_speakers'],
        up_prerequire: json['up_prerequire'],
        up_note: json['up_note'],
        up_reglink: json['up_reglink'],
        up_lastreg: json['up_lastreg'],
        up_regstatus: json['up_regstatus'],
        up_banner: json['up_banner']);
  }
}
//Ends upcoming events Rest API -->>

//Past Events at Events Page REST api --starts here--->>
Future<Album2> fetchAlbum2() async {
  final response =
      await http.get('https://raw.githubusercontent.com/dscnsec/dscnsec-app-resources/main/api/events_data/past_events.json');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album2.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load past_event data');
  }
}

//Data Holder
class Album2 {
  final List<dynamic> past_id;
  final List<dynamic> past_name;
  final List<dynamic> past_desc;
  final List<dynamic> past_date;
  final List<dynamic> past_time;
  final List<dynamic> past_mode;
  final List<dynamic> past_location;
  final List<dynamic> past_speakers;
  final List<dynamic> past_prerequire;
  final List<dynamic> past_note;
  final List<dynamic> past_reglink;
  final List<dynamic> past_lastreg;
  final List<dynamic> past_regstatus;
  final List<dynamic> past_banner;

  Album2({
    this.past_id,
    this.past_name,
    this.past_desc,
    this.past_date,
    this.past_time,
    this.past_mode,
    this.past_location,
    this.past_speakers,
    this.past_prerequire,
    this.past_note,
    this.past_reglink,
    this.past_lastreg,
    this.past_regstatus,
    this.past_banner,
  });

  factory Album2.fromJson(Map<String, dynamic> json) {
    return Album2(
        past_id: json['past_id'],
        past_name: json['past_name'],
        past_desc: json['past_desc'],
        past_date: json['past_date'],
        past_time: json['past_time'],
        past_mode: json['past_mode'],
        past_location: json['past_location'],
        past_speakers: json['past_speakers'],
        past_prerequire: json['past_prerequire'],
        past_note: json['past_note'],
        past_reglink: json['past_reglink'],
        past_lastreg: json['past_lastreg'],
        past_regstatus: json['past_regstatus'],
        past_banner: json['past_banner']);
  }
}

//Ends Past events Rest API -->>

class screen2_events extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return screen2_eventsState();
  }
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;

class screen2_eventsState extends State<screen2_events> {
  //
  Future<Album> futureAlbum;
  Future<Album2> futureAlbum2;

  //

  double xOffset = 0.0;
  double yOffset = 0.0;
  double scalefactor = 1;
  bool isdrawerOpen = false;
  var currentUpcomingPage = up_banner.length - 1.0;
  var currentPastPage = past_banner.length - 1.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureAlbum = fetchAlbum();
    futureAlbum2 = fetchAlbum2();
  }

  @override
  Widget build(BuildContext context) {
    PageController controllerPast =
        PageController(initialPage: past_banner.length);
    controllerPast.addListener(() {
      setState(() {
        currentPastPage = 1 - controllerPast.page;
      });
    });

    PageController controllerUpcoming =
        PageController(initialPage: up_banner.length);
    controllerUpcoming.addListener(() {
      setState(() {
        currentUpcomingPage = 1 - controllerUpcoming.page;
      });
    });

    return WillPopScope(
        onWillPop: _onBackButtonPressed,
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: <Widget>[
                DrawerScreen(),
                AnimatedContainer(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(isdrawerOpen ? 35.0 : 0.0),
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
                                          xOffset = MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3;
                                          yOffset = MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.37;
                                          scalefactor = 0.6;
                                          isdrawerOpen = true;
                                        });
                                      }),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width *
                                        0.06),
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

                        //YOUR CODE GOES HERE ->> DSC NSEC EVENTS SECTION

                        // Upcoming Events here
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.0, vertical: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 20.0, top: 10),
                                child: Text(
                                  "Upcoming Events",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'productSans',
                                  ),
                                ),
                              ),

                              // RotateAnimatedTextKit(
                              //   repeatForever: true,
                              //     transitionHeight: 80,
                              //     text: ["Events", "Meetups", "Webinars"],
                              //     textStyle: TextStyle(color:Colors.blueAccent,fontWeight:FontWeight.bold,fontSize: 35.0, fontFamily: "productSans"),
                              //     textAlign: TextAlign.start
                              // ),
                            ],
                          ),
                        ),

                        //Future builder from Restful api starts from here /////-->>
                        FutureBuilder<Album>(
                          future: futureAlbum,
                          builder: (BuildContext context, snapshot) {
                            if (snapshot.hasData) {
                              up_id = snapshot.data.up_id;
                              up_name = snapshot.data.up_name;
                              up_desc = snapshot.data.up_desc;
                              up_date = snapshot.data.up_date;
                              up_time = snapshot.data.up_time;
                              up_mode = snapshot.data.up_mode;
                              up_location = snapshot.data.up_location;
                              up_speakers = snapshot.data.up_speakers;
                              up_prerequire = snapshot.data.up_prerequire;
                              up_note = snapshot.data.up_note;
                              up_reglink = snapshot.data.up_reglink;
                              up_lastreg = snapshot.data.up_lastreg;
                              up_regstatus = snapshot.data.up_regstatus;
                              up_banner = snapshot.data.up_banner;

                              return Stack(
                                children: <Widget>[
                                  CardScrollUpWidget(currentUpcomingPage),
                                  Positioned.fill(
                                    child: PageView.builder(
                                      itemCount: up_banner.length,
                                      controller: controllerUpcoming,
                                      reverse: true,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () => Navigator.of(context)
                                              .pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  eventFullDetails(
                                                index,
                                                'up',
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              );
                            } else if (snapshot.hasError) {
                              if (up_id[0] == 0)
                                return Container(
                                  padding: EdgeInsets.only(left: 0.0),
                                  child: Image(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                        'assets/images/no_image.gif'),
                                  ),
                                );
                              else
                                return Stack(
                                  children: <Widget>[
                                    CardScrollUpWidget(currentUpcomingPage),
                                    Positioned.fill(
                                      child: PageView.builder(
                                        itemCount: up_banner.length,
                                        controller: controllerUpcoming,
                                        reverse: true,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () => Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    eventFullDetails(
                                                  index,
                                                  'up',
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                );
                            }
                            return Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                              height: 395,
                              child: Center(
                                  child:
                                      // loadingAnimation()
                                      CircularProgressIndicator()),
                            );
                          },
                        ),
                        //////////////////////////////////////////////////////////// ends -->>

                        if (up_id[0] == 0 || up_id == [])
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  futureAlbum = fetchAlbum();
                                  futureAlbum2 = fetchAlbum2();
                                });
                              },
                              child: Center(
                                // padding: const EdgeInsets.only(
                                //     left: 12.0, bottom: 5.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 22.0, vertical: 9.0),
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Text("Refresh Upcoming Events",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "productSans")),
                                ),
                              )),
                        SizedBox(
                          height: 20.0,
                        ),

                        //Past Events Here
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 0.0, vertical: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 20.0, top: 10),
                                child: Text(
                                  "Past Events",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'productSans',
                                  ),
                                ),
                              ),

                              // RotateAnimatedTextKit(
                              //     repeatForever: true,
                              //     transitionHeight: 80,
                              //     text: ["Events", "Meetups", "Webinars"],
                              //     textStyle: TextStyle(color:Colors.purple,fontWeight:FontWeight.bold,fontSize: 35.0, fontFamily: "productSans"),
                              //     textAlign: TextAlign.start
                              // ),
                            ],
                          ),
                        ),

                        //Future builder from Restful api starts from here /////-->>
                        FutureBuilder<Album2>(
                          future: futureAlbum2,
                          builder: (BuildContext context, snapshot) {
                            if (snapshot.hasData) {
                              past_id = snapshot.data.past_id;
                              past_name = snapshot.data.past_name;
                              past_desc = snapshot.data.past_desc;
                              past_date = snapshot.data.past_date;
                              past_time = snapshot.data.past_time;
                              past_mode = snapshot.data.past_mode;
                              past_location = snapshot.data.past_location;
                              past_speakers = snapshot.data.past_speakers;
                              past_prerequire = snapshot.data.past_prerequire;
                              past_note = snapshot.data.past_note;
                              past_reglink = snapshot.data.past_reglink;
                              past_lastreg = snapshot.data.past_lastreg;
                              past_regstatus = snapshot.data.past_regstatus;
                              past_banner = snapshot.data.past_banner;

                              return Stack(
                                children: <Widget>[
                                  CardScrollPastWidget(currentPastPage),
                                  Positioned.fill(
                                    child: PageView.builder(
                                      itemCount: past_banner.length,
                                      controller: controllerPast,
                                      reverse: true,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () => Navigator.of(context)
                                              .pushReplacement(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  eventFullDetails(
                                                index,
                                                'past',
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              );
                            } else if (snapshot.hasError) {
                              if (past_id[0] == 0)
                                return Image(
                                  image:
                                      AssetImage('assets/images/no_image.gif'),
                                );
                              else
                                return Stack(
                                  children: <Widget>[
                                    CardScrollPastWidget(currentPastPage),
                                    Positioned.fill(
                                      child: PageView.builder(
                                        itemCount: past_banner.length,
                                        controller: controllerPast,
                                        reverse: true,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () => Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    eventFullDetails(
                                                  index,
                                                  'past',
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                );
                            }
                            return Container(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                              height: 395,
                              child: Center(
                                  child:
                                      // loadingAnimation()
                                      CircularProgressIndicator()),
                            );
                          },
                        ),
                        //////////////////////////////////////////////////////////// ends -->>
                        if (past_id[0] == 0 || past_id == [])
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  futureAlbum = fetchAlbum();
                                  futureAlbum2 = fetchAlbum2();
                                });
                              },
                              child: Center(
                                // padding: const EdgeInsets.only(
                                //     left: 12.0, bottom: 5.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 22.0, vertical: 9.0),
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Text("Refresh Past Events",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "productSans")),
                                ),
                              )),
                        Container(
                          padding: EdgeInsets.only(bottom: 30),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
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

  // Events Page loading Animation
  Widget loadingAnimation() {
    var assetImage = AssetImage("assets/images/eventLoading.gif");
    var image = Image(
      fit: BoxFit.cover,
      image: assetImage,
      height: 400,
      width: 600,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(0),
    );
  }
}

class CardScrollUpWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollUpWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = up_banner.length - 1; i >= 0; i--) {
          var delta = currentPage - i;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[100], boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3.0, 6.0),
                      blurRadius: 10.0)
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      if (up_id[0] != 0)
                        FadeInImage.assetNetwork(
                            fadeInCurve: Curves.bounceIn,
                            fadeInDuration: const Duration(seconds: 1),
                            placeholder: 'assets/images/loading.gif',
                            image: up_banner[i],
                            fit: BoxFit.fitWidth),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 8.0),
                              child: Text(up_name[i],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25.0,
                                      fontFamily: "productSans",
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            if (up_id[0] != 0)
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, bottom: 12.0),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 22.0, vertical: 6.0),
                                  decoration: BoxDecoration(
                                      color: Colors.blueAccent,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Text("Know More",
                                      style: TextStyle(color: Colors.white)),
                                ),
                              )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return GestureDetector(
          onTap: () {
            print('Hello');
          },
          child: Stack(
            children: cardList,
          ),
        );
      }),
    );
  }
}

class CardScrollPastWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollPastWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = past_banner.length - 1; i >= 0; i--) {
          var delta = currentPage - i;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey[100], boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3.0, 6.0),
                      blurRadius: 10.0)
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      if (past_id[0] != 0)
                        FadeInImage.assetNetwork(
                          fadeInCurve: Curves.bounceIn,
                          fadeInDuration: const Duration(seconds: 1),
                          placeholder: 'assets/images/loading.gif',
                          image: past_banner[i],
                          fit: BoxFit.fitWidth,
                        ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 8.0),
                              child: Text(past_name[i],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25.0,
                                      fontFamily: "productSans",
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            if (past_id[0] != 0)
                              GestureDetector(
                                  onTap: () {
                                    debugPrint("Number ${i} tile tapped...!");
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12.0, bottom: 12.0),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 22.0, vertical: 6.0),
                                      decoration: BoxDecoration(
                                          color: Colors.blueAccent,
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Text("Know More",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ),
                                  ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
