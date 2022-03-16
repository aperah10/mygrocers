import 'package:flutter/material.dart';
import 'package:grocers/Elements/baseAppbar.dart';
import 'package:grocers/common/button.dart';
import 'package:grocers/common/formfield.dart';
import 'package:grocers/scrpart/imgslider.dart';
import 'package:grocers/utils/common.dart';
import 'package:grocers/utils/style.dart';

class SelProdAddScreen extends StatelessWidget {
  SelProdAddScreen({Key? key}) : super(key: key);

  final TextEditingController prodNameController = TextEditingController();
  final TextEditingController QuantityController = TextEditingController();
  final TextEditingController mrpPriceController = TextEditingController();
  final TextEditingController offerPriceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  List helpVal = ['Question 1', 'Question 2', 'Question 3', 'Question 4'];
  List prodList = [
    'assets/images/pulse.png',
    'assets/images/onion.png',
    // 'assets/images/snacks.png',
    'assets/images/potato.png',
    'assets/images/pulse.png',
    'assets/images/watermelon.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Add Product',
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            EditTextField(
              textAlign: TextAlign.left,
              txtColor: txtBlackColor,
              headTxt: 'Product Name',
              fillColor: borderColor,
              hintText: 'Enter product name',
              controller: prodNameController,
            ),
            EditTextField(
              textAlign: TextAlign.left,
              txtColor: txtBlackColor,
              headTxt: 'MRP',
              fillColor: borderColor,
              hintText: 'Enter MRP Price',
              controller: mrpPriceController,
            ),
            Container(
              child: DropDownBtn(
                labelText: 'Select Quantity',
                listData: helpVal,
                fillColor: borderColor,
                pageName: 'Select Quantity',
                vertical: 10,
                listController: QuantityController,
              ),
            ),
            EditTextField(
              textAlign: TextAlign.left,
              txtColor: txtBlackColor,
              headTxt: 'Offer Price',
              fillColor: borderColor,
              hintText: 'Enter Offer Price',
              controller: offerPriceController,
            ),
            heightSizedBox(10.0),
            Text(
              'Upload Photo',
              style: labelTextStyle,
            ),
            ImgHorizontalList(
              prodList: prodList,
              cheight: 80,
            ),
            EditTextField(
              // hoverColor: borderColor,
              textAlign: TextAlign.left,
              txtColor: txtBlackColor,
              headTxt: 'Write Description',
              fillColor: borderColor,
              hintText: 'Enter Description',
              maxLines: 5,
              controller: descriptionController,
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Btn(
          // alignment: Alignment.bottomLeft,
          height: 45,
          width: 100,
          btnName: 'Submit',
          txtColor: txtWhiteColor,
          color: offgreenColor,
          // onTap: () => navigationPush(context, OrderDeatilsScreen()),
        ),
      ),
    );
  }
}
