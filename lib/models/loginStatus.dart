
import 'package:anand_college/Screens/registerScreen.dart';
import 'package:anand_college/Screens/welcomePage.dart';
import 'package:anand_college/models/loginModels.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: Consumer(
        // ignore: missing_return
        builder: (context, LoginModels user, _) {
          switch (user.status) {
            case Status.UnAuthenticated:
              return RegisterScreen();
            case Status.Authenticating:
              return RegisterScreen();
            case Status.Uninitialized:
              return RegisterScreen();
            case Status.Authenticated:
              return WelcomePage();
              break;
          }
        },
      ),
      create: (BuildContext context) {
        return LoginModels.instance();
      },
    );
  }
}
