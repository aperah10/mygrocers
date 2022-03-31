import 'dart:async';

import 'package:flutter/material.dart';
import '../Backend/Model/user.dart';
import '../Screen/welcome.dart';
import '../scrpart/imgslider.dart';
import '../utils/common.dart';
import '../utils/shared_preferences.dart';

ValueNotifier<User> currentUser = ValueNotifier(User());

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // void initState() {
  //   super.initState();
  //   Timer(Duration(seconds: 3), () => navigationPush(context, WelcomeScreen()));
  // }

  SharedHelper sharedHelper = SharedHelper();

  @override
  void initState() {
    // SharedHelper().remove('current_user');
    checkLogin();
    super.initState();
  }

  checkLogin() async {
    bool isLogin = await sharedHelper.containsKey('current_user');
    print('splash Login $isLogin');
    if (isLogin) {
      // currentUser.value = await getCurrentUser();
      // print(currentUser.value.token);
      print('splash Login $isLogin');
      // repo.getScreen(context).then((value) => {
      //       if (value != null)
      //         {
      //           if (value['screen'] == 1)
      //             {}
      //           // navigationRemoveUntil(context, DashBoard(currentTab: 1))
      //           else
      //             {}
      //           // navigationRemoveUntil(context, SellerVerifyFromProfile())
      //         }
      //       else
      //         {
      //           sharedHelper.remove('current_user'),
      //           // navigationRemoveUntil(context, OnBoarding()),
      //         }
      //     });
    } else
      Timer(Duration(seconds: 2),
          () => navigationRemoveUntil(context, WelcomeScreen()));
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

// Future getScreen(context) async {
//   final response = await getMethod(url: URLConstants.currentScreen);

//   if (response != null && response['success'] == 1) {
//     return response;
//   } else {
//     // if (response['data'] != null) snackBar(context, response['message'] ?? '');
//     return null;
//   }
// }
