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
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: ListView(
          children: [
            EditTextField(
              textAlign: TextAlign.left,
              txtColor: txtBlackColor,
              headTxt: 'Product Name',
              // fillColor: borderColor,
              hintText: 'Enter product name',
              controller: prodNameController,
              vertical: 15,
            ),

            Container(
              child: DropDownBtn(
                vertical: 12,
                labelText: 'Select Quantity',
                listData: helpVal,
                fillColor: borderColor,
                pageName: 'Select Quantity',
                listController: QuantityController,
              ),
            ),
            EditTextField(
              vertical: 15,
              textAlign: TextAlign.left,
              txtColor: txtBlackColor,
              headTxt: 'MRP',
              // fillColor: borderColor,
              hintText: 'Enter MRP Price',
              controller: mrpPriceController,
            ),
            EditTextField(
              vertical: 15,
              textAlign: TextAlign.left,
              txtColor: txtBlackColor,
              headTxt: 'Offer Price',
              // fillColor: borderColor,
              hintText: 'Enter Offer Price',
              controller: offerPriceController,
            ),
            heightSizedBox(10.0),
            Text(
              'Upload Photo',
              style: labelTextStyle,
            ),
            // UpdImgFile(
            //   imgSrc1: 'assets/images/pulse.png',
            //   imgSrc2: 'assets/images/onion.png',
            //   imgSrc3: 'assets/images/potato.png',
            // ),
            heightSizedBox(5.0),
            EditTextField(
              // hoverColor: borderColor,
              textAlign: TextAlign.left,
              txtColor: txtBlackColor,
              headTxt: 'Write Description',
              // fillColor: borderColor,
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

class UpdImgFile extends StatelessWidget {
  final String? imgSrc1, imgSrc2, imgSrc3;
  const UpdImgFile({Key? key, this.imgSrc1, this.imgSrc2, this.imgSrc3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: 500,
      child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            SelUpdMultiFile(
                cleanImg: () {
                  // setState(() {
                  //   img1 = null;
                  //   imgSrc1 = null;
                  // });
                },
                imgSrc: imgSrc1,
                upDFile: () {}
                // () async {
                //   var image = await _picker.pickImage(
                //     source: ImageSource.gallery,
                //     imageQuality: 25,
                //   );

                // setState(() {
                //   img1 = image;
                //   imgSrc1 = image!.path.toString();
                //   mimeTypeData1 =
                //       lookupMimeType(imgSrc1)!.split('/');
                // });
                // }
                ),
            SelUpdMultiFile(
              upDFile: () {},
              cleanImg: () {
                // setState(() {
                //   img1 = null;
                //   imgSrc1 = null;
                // });
              },
              imgSrc: imgSrc2,
              // upDFile: () async {
              //   var image = await _picker.pickImage(
              //     source: ImageSource.gallery,
              //     imageQuality: 25,
              //   );

              // setState(() {
              //   img1 = image;
              //   imgSrc1 = image!.path.toString();
              //   mimeTypeData1 =
              //       lookupMimeType(imgSrc1)!.split('/');
              // });
              // }
            ),
            SelUpdMultiFile(
              upDFile: () {},
              cleanImg: () {
                // setState(() {
                //   img1 = null;
                //   imgSrc1 = null;
                // });
              },
              imgSrc: imgSrc3,
              // upDFile: () async {
              //   var image = await _picker.pickImage(
              //     source: ImageSource.gallery,
              //     imageQuality: 25,
              //   );

              // setState(() {
              //   img3 = image;
              //   imgSrc3 = image!.path.toString();
              //   mimeTypeData1 =
              //       lookupMimeType(imgSrc1)!.split('/');
              // });
              // }
            ),
          ]),
    );
  }
}
