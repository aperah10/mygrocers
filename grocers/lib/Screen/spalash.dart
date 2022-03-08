import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grocers/Screen/welcome.dart';
import 'package:grocers/scrpart/imgslider.dart';
import 'package:grocers/utils/common.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => navigationPush(context, WelcomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ImgIcon(
          src: 'assets/images/logo.png',
          height: 150,
          width: 150,
        ),
      ),
    );
  }
}
