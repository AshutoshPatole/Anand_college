import 'package:anand_college/models/userInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bookSeatScreen.dart';

class CourseDetails extends StatefulWidget {
  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  Future courseDetails() async {
    final course = Provider.of<UserInfo>(context, listen: false);
    var db = Firestore.instance;
    DocumentSnapshot doc =
        await db.collection('courses').document(course.courseID).get();
    return doc;
  }

Future getCourseDetails;
  int seatsBooked = 0;
  int remainingSeats = 0;

  Future getAvailableSeats() async {
    final seats = Provider.of<UserInfo>(context, listen: false);
    QuerySnapshot querySnapshot = await Firestore.instance
        .collection('courses')
        .document(seats.courseID)
        .collection('booked')
        .getDocuments();
    setState(() {
      seatsBooked = querySnapshot.documents.length;
      remainingSeats = 180 - seatsBooked;
    });
  }

  @override
  void initState() {
    getCourseDetails = courseDetails();
    getAvailableSeats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final course = Provider.of<UserInfo>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(course.courseID),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: <Widget>[
              FutureBuilder(
                future: getCourseDetails,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    String link = snapshot.data['image'];
                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          link == null
                              ? Container()
                              : Image.network(snapshot.data['image']),
                          Text(snapshot.data['details'].toString()),
                        ],
                      ),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Number of Booked seats ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    seatsBooked.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Number of available seats ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    remainingSeats.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: RaisedButton(
                  child: Text(
                    'Book a Seat',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BookSeat(),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
