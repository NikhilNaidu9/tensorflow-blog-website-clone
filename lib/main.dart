import 'package:flutter/material.dart';
import 'package:fluttersampleapp/Landing/landing.dart';
import 'package:fluttersampleapp/Navbar/navbar.dart';
import 'package:fluttersampleapp/firebase_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tensorflow Blog',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Navbar(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            height: height - 110,
            width: width,
            child: ListView(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Landing()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
