import 'package:flutter/material.dart';
import 'package:grocers/Elements/baseAppbar.dart';
import 'package:grocers/common/button.dart';
import 'package:grocers/common/formfield.dart';
import 'package:grocers/utils/common.dart';

class HelpScreen extends StatelessWidget {
  HelpScreen({Key? key}) : super(key: key);
  final TextEditingController QuestionController = TextEditingController();
  List helpVal = ['Question 1', 'Question 2', 'Question 3', 'Question 4'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        centerTitle: true,
        title: 'Help',
      ),
      body:
          // SingleChildScrollView(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          // child:
          Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            // DropDownBtn(
            //   // listController: ,
            //   listData: helpVal,
            // ),
            Container(
              // width: getWidth(context) / 2.15,
              child: DropDownBtn(
                labelText: 'Select Question',
                listData: helpVal,
                pageName: 'Select Question',
                vertical: 10,
                listController: QuestionController,
              ),
            ),
            heightSizedBox(10.0),
            EditTextField(
              headTxt: 'Message',
              formBox: true,
              hintText: 'Message',
              textAlign: TextAlign.start,
              maxLines: 6,
            )
          ],
        ),
      ),
      // ),
      // ),
    );
  }
}
