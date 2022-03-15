import 'package:flutter/material.dart';
import 'package:grocers/Elements/baseAppbar.dart';
import 'package:grocers/Screen/prodDetails.dart';
import 'package:grocers/Screen/wishlistScr.dart';
import 'package:grocers/utils/common.dart';
import 'package:grocers/utils/style.dart';

import '../common/button.dart';
import '../scrpart/imgslider.dart';

class ProductShowScreen extends StatefulWidget {
  ProductShowScreen({Key? key}) : super(key: key);

  @override
  State<ProductShowScreen> createState() => _ProductShowScreenState();
}

class _ProductShowScreenState extends State<ProductShowScreen> {
  final List<String> item = [
    'All',
    'Banana',
    'Orange',
    'Mango',
    'All2',
    'All3',
    'Banana1',
    'Orange1',
    'Mango1',
    'All4',
    'All5',
    'Banana2',
    'Orange2',
    'Mango2',
    'All6',
  ];
  dynamic menuItem = 'All';
  menuCallback(String value) {
    setState(() {
      menuItem = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBars(
            elevation: 4,
            title: 'Product List',
          ),

          SliverAppBar(
            toolbarHeight: 30,

            // backgroundColor: offgreenColor,
            // expandedHeight: 60.0,
            elevation: 0.0,

            automaticallyImplyLeading: false,
            pinned: true,
            floating: false,

            flexibleSpace: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: item.length,
                    itemBuilder: (context, i) {
                      return MenuItem(
                        i: item[i],
                        selecItem: menuItem,
                        menuCallBack: menuCallback,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),

          //  ! SLIVER PRODUCT CONTENT
          SliverList(
              delegate: SliverChildBuilderDelegate((context, i) {
            return InkWell(
                onTap: () => navigationPush(context, ProductDetailScr()),
                child: CheckProd1());
          }, childCount: 11))
        ],
      ),
    );
  }

  // return Scaffold(
  //   body: CircularProgressIndicator(),
  // );
  // }
}

// ! Menu Item
class MenuItem extends StatefulWidget {
  final dynamic i;
  final dynamic selecItem;
  dynamic menuCallBack;
  MenuItem({Key? key, this.i, this.selecItem, this.menuCallBack})
      : super(key: key);

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  dynamic item = false;
  @override
  Widget build(BuildContext context) {
    // print(widget.selecItem);
    return InkWell(
      onTap: () => widget.menuCallBack(widget.i),
      child: Container(
        margin: const EdgeInsets.only(right: 5.0, left: 5),
        child: Text(
          '${widget.i}',
          style: TextStyle(
              color:
                  widget.selecItem == widget.i ? orangeColor : txtBlackColor),
        ),
      ),
    );
  }
}

// 1 Product
class CheckProd1 extends StatefulWidget {
  final dynamic i;
  CheckProd1({Key? key, this.i}) : super(key: key);

  @override
  State<CheckProd1> createState() => _CheckProd1State();
}

class _CheckProd1State extends State<CheckProd1> {
  dynamic chWid = false;
  dynamic data = false;
  chnageCallBack(dynamic clBtn) {
    setState(() {
      data = clBtn;
    });
    // print('OutSide $clBtn');
  }

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
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          border:
              Border.all(width: 1, color: Color.fromARGB(255, 221, 214, 214))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ImgIcon(
            src: 'assets/images/apple.png',
            width: 120,
            height: 100,
          ),
          ProdMidContent(
            prodNumber: widget.i,
            mrp: fullPrice,
            quantity: quantity,
            price: price,
          ),
          Container(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                InkWell(
                  onTap: () {},
                  child: ImgIcon(
                    src: 'assets/icons/like-icon.png',
                    width: 15,
                    height: 15,
                  ),
                ),
                heightSizedBox(20.0),
                CheckProd2(
                  i: widget.i,
                  chnageCallBack: chnageCallBack,
                  data: data,
                  plusCallBack: plusCallBack,
                  minusCallBack: minusCallBack,
                )
              ]))
        ],
      ),
    );
  }
}

class CheckProd2 extends StatefulWidget {
  final dynamic i;
  final dynamic data;
  dynamic chnageCallBack;
  dynamic plusCallBack;
  dynamic minusCallBack;
  CheckProd2(
      {Key? key,
      this.i,
      this.data,
      this.minusCallBack,
      this.plusCallBack,
      this.chnageCallBack})
      : super(key: key);

  @override
  State<CheckProd2> createState() => _CheckProd2State();
}

class _CheckProd2State extends State<CheckProd2> {
  @override
  Widget build(BuildContext context) {
    if (widget.data == true) {
      return InkWell(
          onTap: () {
            setState(() {
              // chWid = false;
              setState(() {
                widget.chnageCallBack(false);
              });
            });
          },
          child: Container(
              margin: EdgeInsets.all(5),
              child: CartBtn(
                color: Colors.green,
                plusCallBack: widget.plusCallBack,
                minusCallBack: widget.minusCallBack,
              )));
    }
    return InkWell(
      onTap: () => setState(() {
        widget.chnageCallBack(true);
      }),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Btn(
          width: 50,
          padding: EdgeInsets.all(3),

          btnName: 'ADD',
          style: TextStyle(color: txtWhiteColor, fontSize: 10),
          // txtColor: offWhiteColor,
          color: Colors.green,
        ),
      ),
    );
  }
}
