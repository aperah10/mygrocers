import 'package:flutter/material.dart';

const montserratMedium = 'MontserratMedium';
const montserratSemiBold = 'MontserratSemiBold';
const redColor = Color(0xffF6343F);
const darkBlueColor = Color(0xff3232AA);
const textBlueColor = Color(0xff2A1478);
const lightBlueColor = Color(0xffD8D8D8);
const primaryColor = Color(0xFFFFFFFF);
const blackColor = Color(0xFF000000);
const bottomSheet = Color(0xff71181C);
const transparent = Colors.transparent;
const greyColor = Colors.grey;
const offWhiteColor = Color(0xffF8F8FB);
const cartColor = Color(0xffF3F4F8);
const yellowColor = Color(0xffFFD700);

TextStyle smallTextStyle =
    TextStyle(fontFamily: montserratMedium, color: blackColor, fontSize: 14);
TextStyle appBarTS = TextStyle(fontFamily: montserratMedium, fontSize: 18);
TextStyle liteHeadingTS = TextStyle(
    color: Colors.grey.shade600, fontSize: 13.0, fontFamily: montserratMedium);

TextStyle blueTextStyle = TextStyle(
  fontSize: 12.5,
  decoration: TextDecoration.underline,
  fontFamily: montserratMedium,
  color: darkBlueColor,
);

TextStyle labelTextStyle = TextStyle(
  color: Colors.black,
  fontWeight: FontWeight.bold,
  fontFamily: montserratMedium,
  fontSize: 14.0,
);

TextStyle whiteTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: montserratMedium,
  fontSize: 14.0,
);

BoxDecoration boxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(12)),
  boxShadow: [
    BoxShadow(
        color: Colors.grey.withOpacity(0.8),
        blurRadius: 2,
        offset: Offset(-0.1, -0.1)),
  ],
);

BoxDecoration cardDecoration = BoxDecoration(
  color: offWhiteColor,
  borderRadius: BorderRadius.only(
    topLeft: Radius.circular(12),
    topRight: Radius.circular(12),
  ),
);

BoxDecoration fieldDecoration = BoxDecoration(
    color: Colors.white,
    // border: Border.all(color: Colors.grey),
    borderRadius: BorderRadius.circular(8));
