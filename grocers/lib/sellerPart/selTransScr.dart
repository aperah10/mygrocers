import 'package:flutter/material.dart';
import 'package:grocers/Elements/baseAppbar.dart';
import 'package:grocers/common/button.dart';
import 'package:grocers/utils/style.dart';

class SelTranscationScreen extends StatelessWidget {
  const SelTranscationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Transcation History',
        centerTitle: true,
      ),
      body: Container(
          child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, i) => Column(
          // shrinkWrap: true,
          children: [
            ListTile(
              leading: Icon(Icons.arrow_downward, color: offgreenColor),
              trailing: Txt(
                t: 'Rs 150',
                color: offgreenColor,
              ),
              title: Txt(
                t: 'Order ID #555555555',
                style: labelTextStyle,
              ),
              subtitle: Txt(
                t: 'username date ',
                color: Colors.black,
              ),
            ),
            Divider()
          ],
        ),
      )),
    );
  }
}
