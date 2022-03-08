import 'package:flutter/material.dart';
import 'package:grocers/Elements/baseAppbar.dart';
import 'package:grocers/Screen/home.dart';
import 'package:grocers/scrpart/imgslider.dart';
import 'package:grocers/utils/common.dart';

import '../Elements/all_list_content.dart';
import '../common/button.dart';
import '../common/formfield.dart';
import '../utils/style.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // dynamic price;
  // dynamic quantity;
  // dynamic fullPrice;
  // plusCallBack(dynamic cartItem) {
  //   setState(() {
  //     price = cartItem * 50;
  //     quantity = cartItem;
  //     fullPrice = cartItem * 90;
  //     // print(' plus $cartItem');
  //   });
  // }

  // minusCallBack(dynamic cartItem) {
  //   setState(() {
  //     // print('minus $cartItem');
  //     price = cartItem * 50;
  //     quantity = cartItem;
  //     fullPrice = cartItem * 90;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        centerTitle: true,
        title: 'My Cart',
      ),
      body: SingleChildScrollView(
        child: Column(
          // shrinkWrap: true,
          children: [
            CartProdVerList(
                // plusCallBack: plusCallBack,
                // minusCallBack: minusCallBack,
                // price: price,
                // fullPrice: fullPrice,
                // quantity: quantity,
                ),
            CartContentFooter(),
            CartPriceList()
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Btn(
          // alignment: Alignment.bottomLeft,
          height: 45,
          width: double.infinity,
          btnName: 'PROCEED TO PAYMENT',
          txtColor: offWhiteColor,
          color: Colors.green,
        ),
      ),
    );
  }
}

class CartProdContent extends StatefulWidget {
  final dynamic prodNumber;
  // final dynamic plusCallBack;
  // final dynamic minusCallBack;
  // dynamic price;
  // dynamic quantity;
  // dynamic fullPrice;
  CartProdContent({
    Key? key,
    this.prodNumber,
    // this.minusCallBack,
    // this.plusCallBack,
    // this.fullPrice,
    // this.price,
    // this.quantity
  }) : super(key: key);

  @override
  State<CartProdContent> createState() => _CartProdContentState();
}

class _CartProdContentState extends State<CartProdContent> {
  dynamic price;
  dynamic quantity;
  dynamic fullPrice;

  plusCallBack(dynamic cartItem) {
    setState(() {
      price = cartItem * 50;
      quantity = cartItem;
      fullPrice = cartItem * 90;
      // print(' plus $cartItem');
    });
  }

  minusCallBack(dynamic cartItem) {
    setState(() {
      // print('minus $cartItem');
      price = cartItem * 50;
      quantity = cartItem;
      fullPrice = cartItem * 90;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 221, 214, 214)))
            // border: Border.all(
            //     width: 1, color: Color.fromARGB(255, 221, 214, 214))
            ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImgIcon(
              src: 'assets/images/apple.png',
              width: 120,
              height: 100,
            ),
            lineLeft(),
            lineRight()
          ],
        ),
      ),
    );
  }

  Widget lineLeft() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
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

        CartBtn(
          plusCallBack: plusCallBack,
          minusCallBack: minusCallBack,
        ),
      ],
    );
  }

  Widget lineRight() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, right: 8.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ImgIcon(
            src: 'assets/icons/delete-icon.png',
            width: 15,
            height: 15,
          ),
          heightSizedBox(20.0),
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

// ! Cart Item Address and Price Value
class CartContentFooter extends StatelessWidget {
  const CartContentFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          txt(t: 'Apply Promo Code', child: ApplyBox()),
          txt(
              t: 'Delivery Location',
              icon: Icons.edit,
              child: AddressPart(
                trailing: IconBtn(icon: null),
              )),
        ],
      ),
    );
  }

  Widget txt({String? t, Widget? child, IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: t != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Txt(
                        t: t,
                        style: labelTextStyle,
                      ),
                    ),
                    IconBtn(
                        icon: icon ?? null,
                        color: Color.fromARGB(255, 102, 161, 104),
                        onPressed: () {
                          print('update');
                        })
                  ],
                )
              : null,
        ),
        Container(
          child: child,
        )
      ],
    );
  }
}

class CartPriceList extends StatelessWidget {
  const CartPriceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          datas(
            t1: 'Subtotal',
            t2: 'Rs 500',
          ),
          datas(
            t1: 'Delivery Charge',
            t2: 'Rs 500',
          ),
          datas(
              t1: 'Total Discount',
              t2: '- Rs 300',
              style: TextStyle(color: Colors.green, fontSize: 15)),
          datas(
            t1: 'Tax Charge',
            t2: 'Rs 00.00',
          ),
          datas(
              t1: 'Promo Code',
              t2: '- Rs 500',
              style: TextStyle(color: Colors.green, fontSize: 15)),
          heightSizedBox(5.0),
          Container(
              margin: EdgeInsets.all(15),
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 180, 174, 174)),
              padding: EdgeInsets.all(5),
              child: datas(
                t1: 'Total Pay',
                t2: 'Rs 800',
              ))
        ],
      ),
    );
  }

  Widget datas({String? t1, String? t2, TextStyle? style}) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 15.0, right: 15.0, top: 3, bottom: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Txt(
            t: t1,
            style: style ?? labelTextStyle,
          ),
          Txt(
            t: t2,
            style: style ?? labelTextStyle,
          )
        ],
      ),
    );
  }
}
