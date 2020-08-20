import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class screen1_home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return screen1_homeState();
  }
}

class screen1_homeState extends State<screen1_home> {
  @override
  Widget build(BuildContext context) {
    return bodyforhome();
  }

  Widget bodyforhome() {
    return Scaffold(
        // Your Code goes here ----------->
      body: Text("\n\nWelcome to Home. This is sample text."),
        );
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
