import 'package:flutter/material.dart';

import 'Screen/dashBoard.dart';
import 'sellerPart/selHomScr.dart';
import 'sellerPart/selProdAddScr.dart';
import 'sellerPart/selProdListScr.dart';

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
        home: UserNavigationBar(currentTab: 0)

        // home: SellsHomeScr()
        // home: SelProdAddScreen(),
        // home: SelProdListScreen()
        );
  }
}
