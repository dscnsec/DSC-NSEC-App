import 'package:dscnsec_app/Drawer/drawer.dart';
import 'package:flutter/material.dart';
import './introText.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

TextofIntro text = TextofIntro();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0.0;
  double yOffset = 0.0;
  double scalefactor = 1;
  bool isdrawerOpen = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
        child: Stack(
        children: <Widget>[
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
                          icon: Icon(Icons.menu),
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
                height: heiGht>700 ?  MediaQuery.of(context).size.height*0.85 : MediaQuery.of(context).size.height,
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
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
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 25.0),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: <Widget>[
                    EventCard(
                        'assets/images/event2.jpg',
                        'Exploring Machine Learning',
                        '2nd October 2021',
                        'NSEC Campus'),
                    EventCard(
                        'assets/images/event.jpg',
                        'Probability Theory and Statistics',
                        '30th August 2021',
                        'NSEC Campus'),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, bottom: 40.0),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: RaisedButton(
                  padding: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  onPressed: () {},
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
    )])));
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
