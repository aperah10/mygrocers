import 'package:flutter/material.dart';
import 'package:grocers/Screen/wishlistScr.dart';
import 'package:grocers/common/dialogBoxS.dart';
import 'package:grocers/common/formfield.dart';
import 'package:grocers/scrpart/imgslider.dart';
import 'package:grocers/sellerPart/selProdAddScr.dart';
import 'package:grocers/utils/common.dart';
import 'package:grocers/utils/style.dart';
import '../Elements/baseAppbar.dart';

class SelProdListScreen extends StatelessWidget {
  SelProdListScreen({Key? key}) : super(key: key);
  final TextEditingController mrpPriceController = TextEditingController();
  final TextEditingController offerPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        centerTitle: true,
        title: 'Seller Product List',
      ),
      floatingActionButton: InkWell(
        onTap: () => navigationPush(context, SelProdAddScreen()),
        child: ImgIcon(
          src: 'assets/icons/add-icon.png',
          height: 60,
          width: 60,
        ),
      ),
      body: Container(
        child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: ((context, i) {
            return Container(
              // padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Color.fromARGB(255, 221, 214, 214))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ImgIcon(
                    src: 'assets/images/apple.png',
                    width: 120,
                    height: 100,
                  ),
                  ProdMidContent(),
                  // lineRight()
                  ProdLastContent(
                    // src: 'assets/icons/delete-icon.png',
                    btnOnTap: () async {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertBox(
                            title: 'Product Price',
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                EditTextField(
                                  vertical: 15,
                                  textAlign: TextAlign.left,
                                  txtColor: txtBlackColor,
                                  headTxt: 'MRP',
                                  // fillColor: borderColor,
                                  hintText: 'Enter MRP Price',
                                  controller: mrpPriceController,
                                ),
                                heightSizedBox(10),
                                EditTextField(
                                  vertical: 15,
                                  textAlign: TextAlign.left,
                                  txtColor: txtBlackColor,
                                  headTxt: 'Offer Price',
                                  // fillColor: borderColor,
                                  hintText: 'Enter Offer Price',
                                  controller: offerPriceController,
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    btnName: ' Edit   ',
                    removeBtn: false,
                  ),
                ],
              ),
            );
          }),
          itemCount: 15,
        ),
      ),
    );
  }
}
