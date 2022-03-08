import 'package:flutter/material.dart';
import 'package:grocers/Elements/baseAppbar.dart';
import 'package:grocers/common/formfield.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

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
          ListView(
        children: [
          Container(
            // height: 50,
            decoration: BoxDecoration(border: Border.all(width: 1)),
            child: EditTextField(
              headTxt: 'Select Question',
              textAlign: TextAlign.start,
            ),
          ),
          EditTextField(
            headTxt: 'Message',
            textAlign: TextAlign.start,
          )
        ],
      ),
      // ),
      // ),
    );
  }
}
