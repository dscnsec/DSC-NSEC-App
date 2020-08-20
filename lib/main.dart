import 'package:dscnsec_app/screens/screen1_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DSC NSEC',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: screen1_home());
  }
}
