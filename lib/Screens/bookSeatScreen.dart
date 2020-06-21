import 'package:anand_college/Screens/congrats.dart';

import 'package:anand_college/models/loginModels.dart';
import 'package:anand_college/models/userInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookSeat extends StatefulWidget {
  @override
  _BookSeatState createState() => _BookSeatState();
}

class _BookSeatState extends State<BookSeat> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final _tenthSchool = TextEditingController();
  final _twelthSchool = TextEditingController();
  final _tenthCGPA = TextEditingController();
  final _twelthCGPA = TextEditingController();

  @override
  void dispose() {
    _tenthCGPA.dispose();
    _tenthSchool.dispose();
    _twelthCGPA.dispose();
    _twelthSchool.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserInfo>(context, listen: false);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Book Seat'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Please verify and enter all the details'),
              SizedBox(
                height: 30,
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    T(text: 'Your Email ID'),
                    TextFormField(
                      enabled: false,
                      decoration: InputDecoration(hintText: user.email),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    T(text: 'Your Name'),
                    TextFormField(
                      enabled: false,
                      decoration: InputDecoration(hintText: user.name),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    T(text: 'DOB'),
                    TextFormField(
                      enabled: false,
                      decoration: InputDecoration(hintText: user.dob),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    T(text: 'Age'),
                    TextFormField(
                      enabled: false,
                      decoration: InputDecoration(hintText: user.age),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    T(text: 'Gender'),
                    TextFormField(
                      enabled: false,
                      decoration: InputDecoration(hintText: user.sex),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    T(text: 'Nationality'),
                    TextFormField(
                      enabled: false,
                      decoration: InputDecoration(hintText: user.nationality),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    T(text: 'Religion'),
                    TextFormField(
                      enabled: false,
                      decoration: InputDecoration(hintText: user.religion),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    T(text: 'Caste'),
                    TextFormField(
                      enabled: false,
                      decoration: InputDecoration(hintText: user.caste),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    T(text: 'Your Phone number'),
                    TextFormField(
                      enabled: false,
                      decoration: InputDecoration(hintText: user.phoneNumber),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    T(text: '10th School'),
                    TextFormField(
                      controller: _tenthSchool,
                      validator: (value) => (value.isEmpty)
                          ? "Pleas eneter your school name"
                          : null,
                      decoration: InputDecoration(
                        hintText: '10th school name',
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    T(text: '10th CGPA/Mark'),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _tenthCGPA,
                      validator: (value) =>
                          (value.isEmpty) ? "Pleas eneter your marks" : null,
                      decoration: InputDecoration(
                        hintText: 'Enter your 10th marks',
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    T(text: '12th School'),
                    TextFormField(
                      controller: _twelthSchool,
                      validator: (value) => (value.isEmpty)
                          ? "Pleas eneter your school name"
                          : null,
                      decoration: InputDecoration(
                        hintText: '12th school name',
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    T(text: '12th CGPA/CutOff'),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _twelthCGPA,
                      validator: (value) =>
                          (value.isEmpty) ? "Please enter your marks" : null,
                      decoration: InputDecoration(
                        hintText: 'Enter your 12th marks',
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    RaisedButton(
                      child: Text(
                        'Book',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      onPressed: () {
                        formKey.currentState.save();
                        if (formKey.currentState.validate()) {
                          final course =
                              Provider.of<LoginModels>(context, listen: false);
                          course.bookSeat(
                            user.courseID,
                            _tenthSchool.text,
                            _tenthCGPA.text,
                            _twelthSchool.text,
                            _twelthCGPA.text,
                            user.name,
                            user.phoneNumber,
                          );
                          _tenthCGPA.clear();
                          _tenthSchool.clear();
                          _twelthCGPA.clear();
                          _twelthSchool.clear();

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Congrats()));
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class T extends StatelessWidget {
  final String text;

  const T({this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }
}
