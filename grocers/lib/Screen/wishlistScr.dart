import 'package:flutter/material.dart';
import '../Elements/baseAppbar.dart';
import '../common/button.dart';
import '../scrpart/imgslider.dart';
import '../utils/common.dart';
import '../utils/style.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        centerTitle: true,
        title: 'Wishlist',
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
                    src: 'assets/icons/delete-icon.png',
                    onTap: () {},
                    btnName: 'MOVE INTO BAG',
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

// ! Product Mid Cotent
class ProdMidContent extends StatelessWidget {
  final dynamic prodNumber;
  final dynamic mrp;
  final dynamic price;
  final dynamic quantity;
  const ProdMidContent(
      {Key? key, this.prodNumber, this.mrp, this.price, this.quantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Txt(
              t: '4.6 ',
              fontSize: 13,
              color: greyColor,
            ),
            ImgIcon(
              src: 'assets/icons/Star-icon.png',
              width: 10,
              height: 10,
            )
          ],
        ),

        // ! Title
        Container(
          // margin: EdgeInsets.only(top: 5, left: 10),
          child: Txt(
            t: 'Title Name $prodNumber',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          // margin: EdgeInsets.only(top: 5, left: 10),
          alignment: Alignment.topLeft,
          child: Txt(
            // textAlign: TextAlign.left,
            t: 'Quantity ${quantity ?? 1} KG',
            fontSize: 13,
            color: greyColor,
          ),
        ),

        Container(
          // margin: EdgeInsets.only(top: 5, left: 10),
          alignment: Alignment.topLeft,
          child: Txt(
            // textAlign: TextAlign.left,
            t: 'MRP:-${mrp ?? 1500}',
            fontSize: 13, decoration: TextDecoration.lineThrough,
            color: greyColor,
          ),
        ),

        Container(
          // margin: EdgeInsets.only(top: 5, left: 10),
          alignment: Alignment.topLeft,
          child: Txt(
            // textAlign: TextAlign.left,
            t: 'Rs ${price ?? 100}',
            fontSize: 13, style: labelTextStyle,
            color: greyColor,
          ),
        ),
      ],
    );
  }
}

// ! Product  last content
class ProdLastContent extends StatelessWidget {
  final dynamic onTap;

  final String? src;
  final Widget? child;
  final dynamic btnOnTap;
  final String? btnName;
  final bool? removeBtn;

  ProdLastContent(
      {Key? key,
      this.onTap,
      this.src,
      this.removeBtn,
      this.child,
      this.btnOnTap,
      this.btnName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, right: 8.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              child: removeBtn == true
                  ? InkWell(
                      onTap: onTap,
                      child: ImgIcon(
                        src: src ?? 'assets/icons/delete-icon.png',
                        width: 15,
                        height: 15,
                      ),
                    )
                  : null),
          heightSizedBox(20.0),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Btn(
              padding: EdgeInsets.all(3),
              onTap: btnOnTap,
              btnName: btnName ?? 'MOVE INTO BAG',
              style: TextStyle(color: txtWhiteColor, fontSize: 10),
              color: offgreenColor,
            ),
          ),
        ],
      ),
    );
  }
}
