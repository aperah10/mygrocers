import 'dart:ui';

import 'package:flutter/material.dart';
import '../common/cart_order_item.dart';
import '../Elements/baseAppbar.dart';
import '../Screen/home.dart';
import '../scrpart/imgslider.dart';
import '../utils/common.dart';

import '../Elements/all_list_content.dart';
import '../common/button.dart';
import '../common/formfield.dart';
import '../utils/style.dart';
import 'orderDetScr.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final List<Widget> tabs = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ! Sliver app Bar

          SliverAppBars(
            title: 'Cart Screen',
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: AddressPart(
                    trailing: IconBtn(icon: null),
                  ),
                ),
                Divider(),
              ],
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int i) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: borderColor)),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ImgIcon(
                        src: 'assets/images/apple.png',
                        width: 120,
                        height: 100,
                      ),
                      BasicProdDetail(),
                      IconBtn(icon: Icons.delete, size: 20),
                    ],
                  ),
                ),
              ),
              childCount: 15,
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
              children: [Divider(), PriceList()],
            ),
          ),

          //  ! Sliver Product Content
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Btn(
          // alignment: Alignment.bottomLeft,
          height: 45,
          width: double.infinity,
          btnName: 'PROCEED TO PAYMENT',
          txtColor: txtWhiteColor,
          color: offgreenColor,
          onTap: () => navigationPush(context, OrderDeatilsScreen()),
        ),
      ),
    );
  }
}
