import 'package:flutter/material.dart';
import 'package:grocers/Screen/dashBoard.dart';
import 'package:grocers/Screen/home.dart';
import '../common/button.dart';
import '../utils/common.dart';
import '../utils/style.dart';
import 'authconfrim.dart';

class OtpScreen extends StatefulWidget {
  final bool? seller;
  final dynamic phone;
  const OtpScreen({Key? key, this.phone, this.seller}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  // 4 text editing controllers that associate with the 4 input fields
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  List<dynamic> otpList = [];
  String? otpData;

  _otpRegister() {
    print('Otp value $otpData');
    if (otpData!.length == 4) {
      print('otp mobile Number ${widget.phone}');
      if (widget.seller == true) {
        navigationRemoveUntil(context, SellerNavigationBar(currentTab: 0));
      } else {
        navigationRemoveUntil(context, UserNavigationBar(currentTab: 0));
      }
    } else {
      snackBar(context, 'Please fill otp first');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          image: DecorationImage(
              image: AssetImage('assets/images/bg02.png'), fit: BoxFit.fill),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WelcomeTxt(
                title: 'Enter Verfication Code',
                msg: 'We have sent OTP on your number ',
              ),
              heightSizedBox(50.0),
              // Implement 4 input fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OtpInput(_fieldOne, true),
                  OtpInput(_fieldTwo, false),
                  OtpInput(_fieldThree, false),
                  OtpInput(_fieldFour, false)
                ],
              ),
              heightSizedBox(
                30.0,
              ),
              // ! BUTTON OF VERIFY
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Btn(
                  onTap: () {
                    setState(() {
                      otpData = _fieldOne.text +
                          _fieldTwo.text +
                          _fieldThree.text +
                          _fieldFour.text;
                    });
                    _otpRegister();
                  },
                  width: double.maxFinite,
                  height: 40,
                  btnName: 'VERIFY',
                  color: marronColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Create an input widget that takes only one digit
class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Color.fromARGB(195, 228, 137, 18),
          borderRadius: BorderRadius.circular(6)),
      child: TextField(
        style: TextStyle(color: txtWhiteColor),
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: txtWhiteColor,
        // cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: txtBlackColor, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
