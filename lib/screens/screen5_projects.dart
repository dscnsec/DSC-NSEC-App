import 'package:flutter/material.dart';
import '../Drawer/drawer.dart';
import '../customIcons.dart';
import './introText.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

TextofIntro text = TextofIntro();

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  double xOffset = 0.0;
  double yOffset = 0.0;
  double scalefactor = 1;
  bool isdrawerOpen = false;

  @override
  Widget build(BuildContext context) {
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

                      //YOUR CODE GOES HERE ->> DSC NSEC EVENTS SECTION ->

                      Text("Welcome to Projects Section",style: TextStyle(fontSize: 25,fontFamily: 'Google-Sans'),) ,

                    ],
                  ),
                ),
              ),

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
