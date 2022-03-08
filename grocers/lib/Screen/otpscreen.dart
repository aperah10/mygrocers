import 'package:flutter/material.dart';
import 'package:grocers/Screen/home.dart';
import '../common/button.dart';
import '../utils/common.dart';
import '../utils/style.dart';
import 'authconfrim.dart';

class OtpScreen extends StatefulWidget {
  final dynamic phone;
  const OtpScreen({Key? key, this.phone}) : super(key: key);

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
      navigationPush(context, HomeScreen());
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
                  color: bottomSheet,
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
        style: TextStyle(color: offWhiteColor),
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: offWhiteColor,
        // cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}


// actions: [
//             // ! Button for varify
//             // heightSizedBox(height / 10),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 18.0),
//               child: Center(
//                 child: Container(
//                   width: 200,
//                   height: 50,
//                   child: Btn(btnName: 'Verify OTP', onTap: _otpRegister
//                       // () {
//                       // String otp = '';
//                       // for (String item in otpValue) {
//                       //   otp += item;
//                       // }
//                       // if (otp.length == 6) {
//                       //   print('Otp value $otp');
//                       //   print('otp mobile Number ${widget.phone}}');
//                       //   var mat =
//                       //       BlocProvider.of<SellerregconfBloc>(context)
//                       //         ..add(SelRegOtpVerifyEvent(
//                       //             phone: widget.phone, otpN: otp));

//                       // } else {
//                       //   snackBar(context, 'Please fill otp first' + otp);
//                       // }
//                       // },
//                       ),
//                 ),
//               ),
//             ),

//             // ! DON'T receive message
//             // heightSizedBox(height / 5),
//             if (_start <= 0)
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Didn't receive OTP?  ",
//                     style: TextStyle(
//                       fontSize: 13,
//                       color: Colors.grey.shade600,
//                     ),
//                   ),
//                   InkWell(
//                     onTap: () {
//                       // BlocProvider.of<SellerregconfBloc>(context)
//                       //   ..add(SelRegReOtpEvent(
//                       //     phone: widget.phone,
//                       //   ));

//                       // print('otp mobile Number ${widget.phone}');
//                       setState(() {
//                         otpController1.clear();
//                         otpController2.clear();
//                         otpController3.clear();
//                         otpController4.clear();
//                         otpController5.clear();
//                         otpController6.clear();
//                         otpValue.clear();
//                       });

//                       startTimer();
//                     },
//                     child: Text('Resend new OTP',
//                         style: TextStyle(
//                             fontSize: 13,
//                             color: redColor,
//                             decoration: TextDecoration.underline,
//                             fontFamily: montserratMedium)),
//                   ),
//                 ],
//               )
//             else
//               Text(
//                 "00:${_start < 10 ? '0' : ''}$_start ",
//                 style: TextStyle(
//                     fontSize: 13,
//                     color: Colors.grey.shade600,
//                     fontFamily: montserratMedium),
//                 textAlign: TextAlign.center,
//               ),
//           ],
//         ),
//       ),
//     )
