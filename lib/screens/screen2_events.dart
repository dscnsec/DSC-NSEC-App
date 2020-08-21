import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class screen2_events extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return screen2_eventsState();
  }
}

class screen2_eventsState extends State<screen2_events> {
  @override
  Widget build(BuildContext context) {
    return bodyforEvents();
  }

  Widget bodyforEvents() {
    return Scaffold(
      // Your Code goes here ----------->
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
