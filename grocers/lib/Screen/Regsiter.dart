import 'package:flutter/material.dart';
import 'package:grocers/Screen/authconfrim.dart';
import 'package:grocers/Screen/login.dart';
import 'package:grocers/Screen/otpscreen.dart';
import 'package:grocers/common/validate.dart';
import 'package:grocers/utils/style.dart';

import '../common/button.dart';
import '../common/formfield.dart';
import '../utils/common.dart';

class RegisterScr extends StatefulWidget {
  const RegisterScr({Key? key}) : super(key: key);

  @override
  State<RegisterScr> createState() => _RegisterScrState();
}

class _RegisterScrState extends State<RegisterScr> {
  final mobileController = TextEditingController();
  final fullnameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  // ! rister method
  _registerMethod() async {
    var isvalid = _formKey.currentState!.validate();
    // print('valid $isvalid');
    if (!isvalid) {
      return 'Please Enter Valid Data';
    }
    _formKey.currentState!.save();
    if (isvalid == true) {
      navigationPush(context, OtpScreen(phone: mobileController.text));
    }
  }

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
                t: 'Already have an account ?',
                color: greyColor,
              ),
              heightSizedBox(5.0),
              Btn(
                onTap: () => navigationPush(context, LoginScr()),
                height: 40,
                btnName: 'Login Here',
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
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(
                image: AssetImage('assets/images/bg02.png'), fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WelcomeTxt(
                title: 'Create an Account',
                msg:
                    'We are going to send you a OTP to \n authentic your phone number',
              ),
              //  TEXT FORM FIELD
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    // Txt(
                    //   t: 'Enter Mobile Number',
                    //   fontSize: 12,
                    //   color: txtWhiteColor,
                    // ),
                    EditTextField(
                      headTxt: 'fullname',
                      controller: fullnameController,
                      keyboardType: TextInputType.name,
                      maxLength: 10,
                      validator: validateField,
                    ),
                    EditTextField(
                      headTxt: 'Mobile',
                      controller: mobileController,
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      validator: validateMobile,
                    ),
                    EditTextField(
                      headTxt: 'Email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      maxLength: 10,
                      validator: validateEmail,
                    ),
                    EditTextField(
                      headTxt: 'Password',
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      // maxLength: 10,
                      validator: validateField,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Btn(
                        onTap: () => _registerMethod(),
                        width: double.maxFinite,
                        height: 40,
                        btnName: 'CREATE ACCOUNT',
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
