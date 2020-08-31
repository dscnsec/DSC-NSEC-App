import './screens/screen1_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './Drawer/drawer.dart';
void main() {
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent,
  // ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'DSC NSEC',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: MyHomePage());
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return HomeScreen();
  }
}
