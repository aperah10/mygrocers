import 'package:flutter/material.dart';
import 'package:grocers/Elements/baseAppbar.dart';
import 'package:grocers/utils/style.dart';

class SelOrderScreen extends StatelessWidget {
  const SelOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Order ',
        centerTitle: true,
      ),
      body: Center(
          child: Text(
        'Order ',
        style: labelTextStyle,
      )),
    );
  }
}
