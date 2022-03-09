import 'package:flutter/material.dart';
import 'package:grocers/Elements/baseAppbar.dart';
import 'package:grocers/Screen/cartScr.dart';
import 'package:grocers/common/button.dart';
import 'package:grocers/scrpart/imgslider.dart';
import 'package:grocers/utils/common.dart';
import 'package:grocers/utils/style.dart';

class ProductDetailScr extends StatefulWidget {
  ProductDetailScr({Key? key}) : super(key: key);

  @override
  State<ProductDetailScr> createState() => _ProductDetailScrState();
}

class _ProductDetailScrState extends State<ProductDetailScr> {
  final List img = [
    'assets/images/pulse.png',
    'assets/images/onion.png',
    'assets/images/snacks.png',
    'assets/images/potato.png',
    'assets/images/pulse.png',
    'assets/images/watermelon.png',
  ];

  dynamic listImgSrc;

  imgcallBack(dynamic imgSrc) {
    // print('callBack $imgSrc');
    setState(() {
      listImgSrc = imgSrc;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Product Details',
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: ImgIcon(
                margin: EdgeInsets.all(8),
                src: 'assets/icons/like-icon.png',
                width: 25,
                height: 25,
              ),
            ),

            // ! Image Section
            Container(
              alignment: Alignment.center,
              // color: Colors.red,
              child: ImgIcon(
                src: listImgSrc != null
                    ? listImgSrc.toString()
                    : 'assets/images/pulse.png',
                width: 300,
                height: 200,
              ),
            ),
            heightSizedBox(5.0),
            //  Image List Section
            ImgHorizontalList(
              prodList: img,
              callBack: imgcallBack,
              itemBorder: listImgSrc != null ? listImgSrc.toString() : null,
            ),
            // !  Product Content
            ProdDetailsContent(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.bottomCenter,
                child: Txt(
                  t: 'GitHub, Inc. is a provider of Internet hosting for software development and version control using Git. It offers the distributed version control and source code management functionality of Git, plus its own features. ',
                  style: smallTextStyle,
                ),
              ),
            )

            // ! Btn  for Cart
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(20),
        child: Btn(
          // alignment: Alignment.bottomLeft,
          height: 45,
          width: double.infinity,
          btnName: 'Add to Cart',
          txtColor: txtWhiteColor,
          color: Colors.green,
          onTap: () => navigationPush(context, CartScreen()),
        ),
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(20),
      //   child: Btn(
      // alignment: Alignment.bottomLeft,
      //     height: 45,
      //     width: double.infinity,
      //     btnName: 'Add to Cart',
      //     txtColor: offWhiteColor,
      //     color: Colors.green,
      //   ),
      // ),
    );
  }
}

class ProdDetailsContent extends StatefulWidget {
  const ProdDetailsContent({
    Key? key,
  }) : super(key: key);

  @override
  State<ProdDetailsContent> createState() => _ProdDetailsContentState();
}

class _ProdDetailsContentState extends State<ProdDetailsContent> {
  dynamic price;
  dynamic quantity;
  dynamic fullPrice;

  plusCallBack(dynamic cartItem) {
    setState(() {
      price = cartItem * 150;
      quantity = cartItem;
      fullPrice = cartItem * 300;
      // print(' plus $cartItem');
    });
  }

  minusCallBack(dynamic cartItem) {
    setState(() {
      // print('minus $cartItem');
      price = cartItem * 150;
      quantity = cartItem;
      fullPrice = cartItem * 300;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [lineLeft(), lineRight()],
          ),
        ],
      ),
    );
  }

  Widget lineLeft() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ! Title
        Container(
          margin: EdgeInsets.only(top: 5, left: 10),
          // alignment: Alignment.topLeft,
          child: Txt(
            t: 'Title Name',
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, left: 10),
          alignment: Alignment.topLeft,
          child: Txt(
            // textAlign: TextAlign.left,
            t: '${quantity != null ? quantity : 1} KG',
            fontSize: 17,
            color: greyColor,
          ),
        ),

        Container(
          margin: EdgeInsets.only(top: 5, left: 10),
          child: CartBtn(
            plusCallBack: plusCallBack,
            minusCallBack: minusCallBack,
          ),
        ),
      ],
    );
  }

  Widget lineRight() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, right: 8.0),
      child: Column(
        children: [
          Txt(
            t: 'MRP : Rs${fullPrice != null ? fullPrice : 900}',
            decoration: TextDecoration.lineThrough,
            fontSize: 13,
            color: greyColor,
          ),
          Txt(
            t: 'Rs ${price != null ? price : 500}',
            fontSize: 17,
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}
