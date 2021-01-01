import 'package:flutter/material.dart';

class CustomEvent extends StatelessWidget {
  IconData icon;
  String eventInfoText;
  String event;

  CustomEvent({this.icon, this.eventInfoText, this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
              width: MediaQuery.of(context).size.width * .07,
              child: Icon(
                icon,
                color: Colors.blueAccent,
              )),
          Container(
            width: MediaQuery.of(context).size.width * .32,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 5),
            child: Text(
              eventInfoText,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'productSans',
                  color: Colors.grey[600]),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .4,
            padding: EdgeInsets.fromLTRB(5, 0, 5, 5),
            child: Text(
              event,
              style: TextStyle(fontSize: 18, fontFamily: 'productSans'),
            ),
          ),
        ],
      ),
    );
  }
}
