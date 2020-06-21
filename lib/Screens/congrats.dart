import 'package:anand_college/Screens/welcomePage.dart';
import 'package:flutter/material.dart';

class Congrats extends StatefulWidget {
  @override
  _CongratsState createState() => _CongratsState();
}

class _CongratsState extends State<Congrats> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.network(
              'https://image.freepik.com/free-vector/colorful-balloons-with-banner-word-congrats_1308-16818.jpg'),
          RaisedButton(
            elevation: 8,
            child: Text(
              'Take me back home',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => WelcomePage()));
            },
          )
        ],
      ),
    );
  }
}
