import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 800) {
        return DesktopNavbar();
      } else {
        return MobileNavbar();
      }
    });
  }
}

class DesktopNavbar extends StatelessWidget {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Material(
          elevation: 1.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
            height: 50.0,
            width: width,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          FlutterLogo(
                            colors: Colors.orange,
                            size: 30.0,
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            'TensorFlow',
                            style: TextStyle(
                                color: Color.fromRGBO(0x4A, 0x57, 0x6c, 1),
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Montserrat',
                                fontSize: 27.0),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            'Blog',
                            style: TextStyle(
                                color: Colors.grey[600], fontSize: 27.0),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              height: 30.0,
                              width: 190.0,
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(0xF5, 0xF7, 0xF7, 1),
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.search,
                                    color: Colors.black45,
                                  ),
                                  SizedBox(
                                    width: 4.0,
                                  ),
                                  Container(
                                    height: 30.0,
                                    width: 150.0,
                                    child: TextField(
                                      showCursor: false,
                                      controller: search,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                          SizedBox(
                            width: 25.0,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.arrow_back,
                                    color: Color.fromRGBO(0x4A, 0x57, 0x6c, 1),
                                  ),
                                  SizedBox(
                                    width: 4.0,
                                  ),
                                  Text(
                                    'Return to TensorFlow Home',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color:
                                            Color.fromRGBO(0x4A, 0x57, 0x6c, 1),
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Material(
          elevation: 2.0,
          child: Container(
            padding: EdgeInsets.all(15.0),
            decoration:
                BoxDecoration(color: Color.fromRGBO(0xF5, 0xF7, 0xF7, 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'All',
                          style: TextStyle(
                              color: Color.fromRGBO(0x4A, 0x57, 0x6c, 1),
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      SizedBox(
                        width: 35.0,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'TensorFlow Core',
                          style: TextStyle(
                              color: Color.fromRGBO(0x4A, 0x57, 0x6c, 1),
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      SizedBox(
                        width: 35.0,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'TensorFlow.js',
                          style: TextStyle(
                              color: Color.fromRGBO(0x4A, 0x57, 0x6c, 1),
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      SizedBox(
                        width: 35.0,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'TensorFlow Lite',
                          style: TextStyle(
                              color: Color.fromRGBO(0x4A, 0x57, 0x6c, 1),
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      SizedBox(
                        width: 35.0,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'TFX',
                          style: TextStyle(
                              color: Color.fromRGBO(0x4A, 0x57, 0x6c, 1),
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      SizedBox(
                        width: 35.0,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Swift',
                          style: TextStyle(
                              color: Color.fromRGBO(0x4A, 0x57, 0x6c, 1),
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                      SizedBox(
                        width: 35.0,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Text(
                          'Community',
                          style: TextStyle(
                              color: Color.fromRGBO(0x4A, 0x57, 0x6c, 1),
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Montserrat'),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      FlutterLogo(
                        colors: Colors.grey,
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      FlutterLogo(
                        colors: Colors.grey,
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      FlutterLogo(
                        colors: Colors.grey,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MobileNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
