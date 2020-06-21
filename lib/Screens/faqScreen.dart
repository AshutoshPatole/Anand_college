import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen();
  Future getFAQ() async {
    var db = Firestore.instance;
    QuerySnapshot querySnapshot = await db.collection('FAQ').getDocuments();
    return querySnapshot.documents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('FAQ'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FutureBuilder(
              future: getFAQ(),
              builder: (context, snapshot) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data?.length ?? 0,
                  itemBuilder: (context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 0.2,
                          color: Colors.grey[500],
                        ),
                      ),
                      child: ExpansionTile(
                        title: Text(snapshot.data[index]?.data['ques'] ?? ' '),
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child:
                                Text(snapshot.data[index]?.data['ans'] ?? ' '),
                          )
                        ],
                      ),
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
