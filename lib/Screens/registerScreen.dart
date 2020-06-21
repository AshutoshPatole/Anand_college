import 'package:anand_college/Screens/loginScreen.dart';
import 'package:anand_college/models/loginModels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _regsiterFormKey = GlobalKey<FormState>();
  final _registerScaffoldKey = GlobalKey<ScaffoldState>();
  final _nameKey = TextEditingController();
  final _registerEmailController = TextEditingController();
  final _registerPasswordController = TextEditingController();
  final _confirmPassword = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _fathersName = TextEditingController();
  final _dob = TextEditingController();
  final _nationality = TextEditingController();
  final _caste = TextEditingController();
  final _religion = TextEditingController();

  final _sex = TextEditingController();
  final _age = TextEditingController();

  @override
  void dispose() {
    _registerEmailController.dispose();
    _registerPasswordController.dispose();
    _confirmPassword.dispose();
    _phoneNumber.dispose();
    _nameKey.dispose();
    _fathersName.dispose();
    _dob.dispose();
    _nationality.dispose();
    _caste.dispose();
    _religion.dispose();
    _sex.dispose();
    _age.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _registerScaffoldKey,
      appBar: AppBar(
        title: Text(
          'Register',
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _regsiterFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextWidget(
                  text: 'Name',
                ),
                TextFormField(
                  controller: _nameKey,
                  validator: (value) =>
                      (value.isEmpty) ? "Pleas eneter your name" : null,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextWidget(
                  text: 'Fathers/Guardian Name',
                ),
                TextFormField(
                  controller: _fathersName,
                  validator: (value) => (value.isEmpty)
                      ? "Pleas eneter your guardian name"
                      : null,
                  decoration: InputDecoration(
                    hintText: 'Enter your Guardian name',
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextWidget(
                  text: 'DOB',
                ),
                TextFormField(
                  controller: _dob,
                  validator: (value) =>
                      (value.isEmpty) ? "Pleas eneter your DOB" : null,
                  decoration: InputDecoration(
                    hintText: 'DD/MM/YYYY',
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextWidget(
                  text: 'Gender',
                ),
                TextFormField(
                  controller: _sex,
                  validator: (value) =>
                      (value.isEmpty) ? "Pleas eneter your sex" : null,
                  decoration: InputDecoration(
                    hintText: 'Male/Female',
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextWidget(
                  text: 'Age',
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _age,
                  validator: (value) =>
                      (value.isEmpty) ? "Pleas eneter your age" : null,
                  decoration: InputDecoration(
                    hintText: 'Enter your age',
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextWidget(
                  text: 'Nationality',
                ),
                TextFormField(
                  controller: _nationality,
                  validator: (value) =>
                      (value.isEmpty) ? "Pleas eneter your nationality" : null,
                  decoration: InputDecoration(
                    hintText: 'Enter your nationality',
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextWidget(
                  text: 'Caste',
                ),
                TextFormField(
                  controller: _caste,
                  validator: (value) =>
                      (value.isEmpty) ? "Pleas eneter your caste" : null,
                  decoration: InputDecoration(
                    hintText: 'Enter your caste',
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextWidget(
                  text: 'Religion',
                ),
                TextFormField(
                  controller: _religion,
                  validator: (value) =>
                      (value.isEmpty) ? "Pleas eneter your religion" : null,
                  decoration: InputDecoration(
                    hintText: 'Enter your religion',
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                
                TextWidget(
                  text: 'Email ID',
                ),
                TextFormField(
                  controller: _registerEmailController,
                  validator: (value) =>
                      (value.isEmpty) ? "Incorrect Email ID" : null,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter your Email ',
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextWidget(
                  text: 'Phone Number',
                ),
                TextFormField(
                  controller: _phoneNumber,
                  keyboardType: TextInputType.number,
                  validator: (value) => (value.isEmpty || value.length < 10)
                      ? "Pleas eneter your Phone Number"
                      : null,
                  decoration: InputDecoration(
                    hintText: 'Enter your phone number',
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextWidget(
                  text: 'Password',
                ),
                TextFormField(
                  controller: _registerPasswordController,
                  obscureText: true,
                  validator: (value) => (value.isEmpty || value.length < 6)
                      ? "Password should be 6 chars long"
                      : null,
                  decoration: InputDecoration(
                    hintText: 'Enter your Password',
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                TextWidget(
                  text: 'Confirm Password',
                ),
                TextFormField(
                  controller: _confirmPassword,
                  obscureText: true,
                  validator: (value) => (value.isEmpty ||
                          (_registerPasswordController.text !=
                              _confirmPassword.text))
                      ? "Password doesn't matched"
                      : null,
                  decoration: InputDecoration(
                    hintText: 'Password again',
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  '*Your data is safe. We don\'t spam',
                  style: TextStyle(
                      color: Colors.green, fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 18,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    onPressed: () {
                      registerUser();
                    },
                    color: Colors.blue,
                    child: Text('Register', style: TextStyle(color: Colors.white),),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text('Already a member?    '),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPage()));
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void registerUser() async {
    final resgiter = Provider.of<LoginModels>(context, listen: false);
    _regsiterFormKey.currentState.save();
    if (_regsiterFormKey.currentState.validate()) {
      try {
        resgiter.signUp(
          _registerEmailController.text,
          _registerPasswordController.text,
          _phoneNumber.text,
          _nameKey.text,
          _fathersName.text,
          _dob.text,
          _sex.text,
          _age.text,
          _nationality.text,
          _caste.text,
          _religion.text,
        );
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false);
      } catch (e) {
        print(e);
      }
    }
  }
}

class TextWidget extends StatelessWidget {
  final String text;

  const TextWidget({this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    );
  }
}
