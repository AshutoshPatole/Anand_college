import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  Future getAbout() async {
    var db = Firestore.instance;
    DocumentSnapshot snapshot =
        await db.collection('about').document('about').get();
    return snapshot;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: FutureBuilder(
        future: getAbout(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Text(snapshot.data['about']),
              ),
            );
          }
        },
      ),
    );
  }
}
