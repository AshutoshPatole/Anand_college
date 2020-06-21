import 'package:anand_college/Screens/registerScreen.dart';
import 'package:anand_college/Screens/welcomePage.dart';
import 'package:anand_college/models/loginModels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Login',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Please sign in to continue',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Enter your E-mail ID'),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          (value.isNotEmpty) ? null : 'Please enter your Email',
                      controller: _emailController,
                      decoration: InputDecoration(hintText: 'E-Mail ID'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Enter your Password'),
                    TextFormField(
                      validator: (value) => (value.isNotEmpty)
                          ? null
                          : 'Please enter your Password',
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(hintText: 'Password'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: RaisedButton(
                        onPressed: () {
                          loginFunction();
                        },
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text('New to AIHT ?'),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void loginFunction() async {
    final login = Provider.of<LoginModels>(context, listen: false);
    _formKey.currentState.save();
    if (_formKey.currentState.validate()) {
      if (await login.signIn(_emailController.text, _passwordController.text)) {
        _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('Successfully signed in'),
        ));
        Future.delayed(Duration(milliseconds: 2000));
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => WelcomePage()));
      } else {
        print('not logged in');
      }
    }
  }
}
