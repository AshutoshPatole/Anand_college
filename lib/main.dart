import 'package:anand_college/Screens/splashScreen.dart';
import 'package:anand_college/models/loginModels.dart';
import 'package:anand_college/models/userInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoginModels.instance(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserInfo(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
