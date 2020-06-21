import 'package:anand_college/Screens/aboutScreen.dart';
import 'package:anand_college/Screens/contact.dart';
import 'package:anand_college/Screens/faqScreen.dart';
import 'package:anand_college/Screens/helpScreen.dart';
import 'package:anand_college/Screens/loginScreen.dart';
import 'package:anand_college/Screens/profileScreen.dart';
import 'package:anand_college/models/loginModels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  final List menuItems = [
    'Profile',
    'About Us',
    'FAQ',
    'Help',
    'Contact Us'
  ];
  final List<IconData> menuIcons = [
    Icons.perm_identity,
    Icons.info_outline,
    Icons.question_answer,
    Icons.help_outline,
    Icons.contacts
  ];
  final List<Widget> menuNavigation = [
    ProfileScreen(),
    AboutScreen(),
    FAQScreen(),
    HelpPage(),
    Contact()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: menuItems?.length ?? 0,
                itemBuilder: (context, int index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => menuNavigation[index]));
                        },
                        leading: Icon(menuIcons[index]),
                        title: Text(
                          menuItems[index],
                          style: TextStyle(fontSize: 14),
                        ),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black54,
                          size: 15,
                        ),
                      ),
                      const Divider(
                        color: Colors.black54,
                        height: 5,
                      )
                    ],
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: () async {
                    final user =
                        Provider.of<LoginModels>(context, listen: false);
                    user.signOut();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (route) => false);
                  },
                  child: Row(
                    children: <Widget>[
                      const Icon(
                        Icons.power_settings_new,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Logout',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                      const Expanded(
                        child: const Align(
                          alignment: Alignment.centerRight,
                          child: const Text(
                            "Version 1.0.0",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
