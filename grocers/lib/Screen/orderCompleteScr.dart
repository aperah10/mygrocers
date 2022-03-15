import 'package:flutter/material.dart';
import 'package:grocers/Elements/baseAppbar.dart';
import 'package:grocers/Screen/dashBoard.dart';
import 'package:grocers/Screen/home.dart';
import 'package:grocers/common/button.dart';
import 'package:grocers/utils/common.dart';
import 'package:grocers/utils/style.dart';

class OrderCompleteScreen extends StatelessWidget {
  const OrderCompleteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        centerTitle: true,
        title: 'Order Complete',
        leadingOnTap: () => navigationPush(
            context,
            UserNavigationBar(
              currentTab: 0,
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        // crossAxisAlignment: ,
        children: [
          Center(
            child: Txt(
              t: 'Your Order has been                               \n        accepted',
              style: labelTextStyle,
            ),
          ),
          heightSizedBox(5.0),
          Center(
            child: Txt(
              t: "Your Items has been placed and is on \n It's way to being processed",
              style: smallTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}
