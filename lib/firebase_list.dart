import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseList extends StatefulWidget {
  @override
  _FirebaseListState createState() => _FirebaseListState();
}

class _FirebaseListState extends State<FirebaseList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: Firestore.instance.collection('tags').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return new Text('Error ${snapshot.hasError}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return new CircularProgressIndicator();
            default:
              return Container(
                height: 400.0,
                width: 1200.0,
                child: new ListView(
                  children:
                      snapshot.data.documents.map((DocumentSnapshot document) {
                    return new Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                document['name'],
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18.0,
                                    color: Color.fromRGBO(0x58, 0x65, 0x78, 1)),
                              ),
                              Icon(Icons.arrow_forward, color: Colors.black38)
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
    );
  }
}
