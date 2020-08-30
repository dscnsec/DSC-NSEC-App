import 'package:flutter/material.dart';
import '../Drawer/drawer.dart';
import './introText.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

TextofIntro text = TextofIntro();

class ProjectPage extends StatefulWidget {
  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            DrawerScreen(),
            ProjectScreen(),
          ],
        ),
      ),
    );
  }
}

class ProjectScreen extends StatefulWidget {
  @override
  _ProjectScreenState createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  double xOffset = 0.0;
  double yOffset = 0.0;
  double scalefactor = 1;
  bool isdrawerOpen = false;
  @override
  Widget build(BuildContext context) {
    
    double heiGht = MediaQuery.of(context).size.height;
    return Scaffold(
      
    
      body: AnimatedContainer(
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
                height: 200,
                width: 200,
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
