import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Email ID',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 35,
                ),
                Text(
                  'aiht email.com',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Contact',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 35,
                ),
                Text(
                  '08637447211',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Address',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 35,
                ),
                Expanded(
                  child: Text(
                    'Old Mahabalipuram Road, Kalasalingam Nagar, KazhipatturPadur, Chennai - 603103 Landmark: NEAR  Indian Bank',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Website',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  width: 35,
                ),
                Expanded(
                  child: Text(
                    'http://www.aiht.ac.in',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
