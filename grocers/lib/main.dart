import 'dart:io';

import 'package:flutter/material.dart';
import 'package:grocers/Screen/spalash.dart';

import 'Screen/dashBoard.dart';
// import 'sellerPart/selHomScr.dart';
// import 'sellerPart/selProdAddScr.dart';
// import 'sellerPart/selProdListScr.dart';
// import 'sellerPart/selTransScr.dart';
import 'utils/shared_preferences.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  // HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  SharedHelper sharedData = SharedHelper();
  // ! TAKING TOKEN DATA

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(sharedData.getString(''));
    // print(sharedData.getString('rahul'));
    return MaterialApp(
        title: 'Grocery App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen()
        // home: UserNavigationBar(
        //   currentTab: 0,
        // )
        );
  }
}
