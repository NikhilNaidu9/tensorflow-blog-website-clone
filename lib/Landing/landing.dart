import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          return DesktopLanding();
        } else {
          return MobileLanding();
        }
      },
    );
  }
}

class DesktopLanding extends StatefulWidget {
  @override
  _DesktopLandingState createState() => _DesktopLandingState();
}

class _DesktopLandingState extends State<DesktopLanding> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            width: width - 100,
            height: height / 2.8,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey[200],
                      blurRadius: 20.0,
                      spreadRadius: 3.0)
                ],
                borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              children: [
                FlutterLogo(
                  size: 400.0,
                  colors: Colors.orange,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Featured',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color.fromRGBO(0x58, 0x65, 0x78, 1)),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Responsible AI with TensorFlow',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0x43, 0x51, 0x67, 1)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: [
            StreamBuilder(
              stream: Firestore.instance.collection('blogs').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError)
                  return new Text('Error ${snapshot.hasError}');
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return new CircularProgressIndicator();
                  default:
                    return Container(
                      height: height,
                      width: width - 400,
                      child: new ListView(
                        children: snapshot.data.documents
                            .map((DocumentSnapshot document) {
                          return new Container(
                            margin: EdgeInsets.all(10.0),
                            height: 350.0,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[200],
                                      blurRadius: 20.0,
                                      spreadRadius: 3.0)
                                ],
                                borderRadius: BorderRadius.circular(10.0)),
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              document['image_url']),
                                          fit: BoxFit.fitWidth)),
                                  width: 500.0,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      document['tag'],
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Color.fromRGBO(
                                              0x61, 0x6D, 0x7F, 1)),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      document['title'],
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(
                                              0x43, 0x51, 0x67, 1)),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      'Detection API',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromRGBO(
                                              0x43, 0x51, 0x67, 1)),
                                    ),
                                    SizedBox(
                                      height: 20.0,
                                    ),
                                    Text(
                                      'July 10, 2020 -- Posted by Vivek Rathod and Joathon Huang',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 15.0,
                                          color: Colors.black38),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    );
                }
              },
            ),
            SizedBox(
              width: 20.0,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    'Tags',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  StreamBuilder(
                    stream: Firestore.instance.collection('tags').snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError)
                        return new Text('Error ${snapshot.hasError}');
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return new CircularProgressIndicator();
                        default:
                          return Container(
                            height: height,
                            width: width - 1150,
                            child: new ListView(
                              children: snapshot.data.documents
                                  .map((DocumentSnapshot document) {
                                return new Container(
                                  padding: EdgeInsets.only(bottom: 25.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            document['name'],
                                            style: TextStyle(
                                                fontFamily: 'Montserrat',
                                                fontSize: 18.0,
                                                color: Color.fromRGBO(
                                                    0x58, 0x65, 0x78, 1)),
                                          ),
                                          Icon(Icons.arrow_forward,
                                              color: Colors.black38)
                                        ],
                                      ),
                                      SizedBox(
                                        height: 25.0,
                                      ),
                                      Container(
                                        height: 1.0,
                                        width: 300.0,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          );
                      }
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

class MobileLanding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
