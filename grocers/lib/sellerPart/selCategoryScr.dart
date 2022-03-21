import 'package:flutter/material.dart';
import 'package:grocers/Elements/baseAppbar.dart';
import 'package:grocers/utils/style.dart';

class SelCategoryScreen extends StatelessWidget {
  const SelCategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Category',
        centerTitle: true,
      ),
      body: Center(
          child: Text(
        'Category ',
        style: labelTextStyle,
      )),
    );
  }
}
