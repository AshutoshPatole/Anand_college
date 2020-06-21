import 'package:anand_college/Screens/homeScreen.dart';
import 'package:anand_college/models/loginModels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'menuScreen.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 300), () {
      Provider.of<LoginModels>(context, listen: false).getUsersDetails();
    });
    super.initState();
  }

  int selectedPage = 0;
  final List<Widget> pages = [
    HomeScreen(),
    MenuScreen(),
  ];

  void _onPageTapped(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Container()),
          BottomNavigationBarItem(icon: Icon(Icons.menu), title: Container())
        ],
        currentIndex: selectedPage,
        selectedItemColor: Colors.blue,
        onTap: _onPageTapped,
      ),
    );
  }
}
