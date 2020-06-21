import 'package:anand_college/models/loginModels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 300), () {
      Provider.of<LoginModels>(context, listen: false).getUsersDetails();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final values = Provider.of<LoginModels>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
       title: Text('Profile'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 70,
              ),
            
              const Text(
                'Name',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              Text(
                values.userName ?? " ",
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Phone Number',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              Text(
                '+91 ${values.phoneNumber ?? " "}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Email Address',
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
              Text(
                values.user?.email ?? " ",
                style: const TextStyle(fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
