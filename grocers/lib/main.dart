import 'package:flutter/material.dart';
import 'package:grocers/Screen/home.dart';
import 'package:grocers/Screen/notificationScr.dart';

import 'Screen/cartScr.dart';
import 'Screen/faqScr.dart';
import 'Screen/helpScr.dart';
import 'Screen/orderDetScr.dart';
import 'Screen/orderScr.dart';
import 'Screen/spalash.dart';
import 'Screen/wishlistScr.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Grocery App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: SplashScreen(),
        // home: OrderScreen(),
        // home: HomeScreen(),
        // home: WelcomeScr()
        home: HelpScreen());
  }
}
