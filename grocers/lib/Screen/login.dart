import 'package:flutter/material.dart';
import 'package:grocers/Screen/Regsiter.dart';
import 'package:grocers/Screen/authconfrim.dart';
import 'package:grocers/Screen/otpscreen.dart';
import 'package:grocers/common/validate.dart';
import 'package:grocers/utils/style.dart';

import '../common/button.dart';
import '../common/formfield.dart';
import '../utils/common.dart';

class LoginScr extends StatefulWidget {
  final bool? seller;
  const LoginScr({Key? key, this.seller}) : super(key: key);

  @override
  State<LoginScr> createState() => _LoginScrState();
}

class _LoginScrState extends State<LoginScr> {
  final mobileController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  // ! rister method
  _loginMethod() async {
    var isvalid = _formKey.currentState!.validate();
    // print('valid $isvalid');
    if (!isvalid) {
      return 'Please Enter Valid Data';
    }
    _formKey.currentState!.save();
    if (isvalid == true) {
      navigationPush(context,
          OtpScreen(seller: widget.seller, phone: mobileController.text));
    }
  }

  // ! end register method

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          // bottomSheet:
          Container(
        height: 85,
        decoration: BoxDecoration(
          color: offWhiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 18.0, left: 25, right: 25, bottom: 5),
          child: Column(
            children: [
              Txt(
                t: 'Don\'t have account ?',
                color: greyColor,
              ),
              heightSizedBox(5.0),
              Btn(
                onTap: () => navigationPush(context, RegisterScr()),
                height: 40,
                btnName: 'Create an account',
                color: redColor,
              ),
            ],
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.only(
            //   bottomLeft: Radius.circular(25),
            //   bottomRight: Radius.circular(25),
            // ),
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
                image: AssetImage('assets/images/bg02.png'), fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WelcomeTxt(
                msg: 'Welcome to Login Page ',
              ),
              //  TEXTFORMFIELD
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Txt(
                      t: 'Enter Mobile Number',
                      fontSize: 12,
                      color: txtWhiteColor,
                    ),
                    EditTextField(
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      validator: validateMobile,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Btn(
                        onTap: () => _loginMethod(),
                        width: double.maxFinite,
                        height: 40,
                        btnName: 'LOGIN',
                        color: marronColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// Align(
            // alignment: Alignment.bottomCenter,
            // child: Container(
            //   height: 85,
            //   decoration: BoxDecoration(
            //     color: offWhiteColor,
            //     borderRadius: BorderRadius.only(
            //       topLeft: Radius.circular(25),
            //       topRight: Radius.circular(25),
            //     ),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.only(
            //         top: 18.0, left: 25, right: 25, bottom: 5),
            //     child: Column(
            //       children: [
            //         Txt(
            //           t: 'Don\'t have account ?',
            //           color: greyColor,
            //         ),
            //         heightSizedBox(5),
            //         Btn(
            //           onTap: () => navigationPush(context, OtpScreen()),
            //           height: 40,
            //           btnName: 'Create an account',
            //           color: redColor,
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          // )