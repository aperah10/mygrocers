import 'package:flutter/material.dart';
import 'package:grocers/Elements/baseAppbar.dart';
import 'package:grocers/Screen/wishlistScr.dart';
import 'package:grocers/utils/common.dart';
import 'package:grocers/utils/style.dart';

import '../Elements/all_list_content.dart';
import '../common/button.dart';
import '../scrpart/imgslider.dart';

class ProductShowScreen extends StatefulWidget {
  ProductShowScreen({Key? key}) : super(key: key);

  @override
  State<ProductShowScreen> createState() => _ProductShowScreenState();
}

class _ProductShowScreenState extends State<ProductShowScreen>
    with TickerProviderStateMixin {
  final List<String> item = [
    'All',
    'Banana',
    'Orange',
    'Mango',
    'All2',
  ];
  dynamic _activeTabIndex;

  final List<Widget> tabs = [];
  TabController? _controller;
  int _selectedIndex = 0;
  @override
  void initState() {
    if (item.length > 0) {
      for (var i in item) {
        tabs.add(Tab(
          text: i,
        ));
      }
    }
    super.initState();
    _controller = TabController(length: tabs.length, vsync: this);
    // _controller!.addListener(_setActiveTabIndex);

    // _controller = TabController(vsync: this, length: 4)
    //   ..addListener(() {
    //     setState(() {
    //       _activeTabIndex = _controller!.index;
    //       // switch (_contro ller!.index) {
    //       //   case 0:
    //       //   // some code here
    //       //   case 1:
    //       //   // some code here
    //       // }
    //     });
    // });
  }

  // void _setActiveTabIndex() {
  //   _activeTabIndex = _controller!.index;
  // }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (item.length > 0) {
    // for (var i in item) {
    //   tabs.add(Tab(
    //     text: i,
    //   ));
    // }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: true,
            title: Txt(t: 'Fruits', style: labelTextStyle),
            actions: [
              IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () {},
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(55),
              child:
                  // Container(
                  //   height: 50,
                  //   child: ListView.builder(
                  //       shrinkWrap: true,
                  //       scrollDirection: Axis.horizontal,
                  //       itemCount: 25,
                  //       itemBuilder: ((context, index) {
                  //         return Text('Home $index');
                  //       })),
                  // )
                  DefaultTabController(
                      length: tabs.length,
                      child: TabBar(
                        controller: _controller,
                        isScrollable: true, // Required
                        unselectedLabelColor: Colors.white, // Other tabs color
                        labelPadding: EdgeInsets.symmetric(
                            horizontal: 10), // Space between tabs
                        indicator: UnderlineTabIndicator(
                          borderSide: BorderSide(
                              color: Colors.orange,
                              width: 2), // Indicator height
                          insets: EdgeInsets.symmetric(
                              horizontal: 20), // Indicator width
                        ),
                        tabs: tabs,
                      )),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, i) {
            // for (var i in tabs) {
            //   // print(i);
            // }
            // print(_controller!.index);
            // print(_controller!.indexIsChanging);
            // print(_activeTabIndex);
            return Column(
              children: [
                // Text('tab ${_controller!.index} '),
                CheckProd1(),
              ],
            );
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

// ! staless Widget
// class ProdShowScreen extends StatefulWidget {
//   ProdShowScreen({Key? key}) : super(key: key);

//   @override
//   State<ProdShowScreen> createState() => _ProdShowScreenState();
// }

// class _ProdShowScreenState extends State<ProdShowScreen> {
//   dynamic childVal = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: BaseAppBar(
//         centerTitle: true,
//         title: 'ProductList',
//       ),
//       body: Container(
//         child: ListView.builder(
//             itemCount: 10,
//             itemBuilder: (context, i) {
//               return CheckProd1();
//             }),
//       ),
//     );
//   }
// }

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
          width: 100,
          padding: EdgeInsets.all(3),

          btnName: 'ADD',
          style: TextStyle(color: offWhiteColor, fontSize: 10),
          // txtColor: offWhiteColor,
          color: Colors.green,
        ),
      ),
    );
  }
}
