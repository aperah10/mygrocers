import 'package:flutter/material.dart';
import 'package:grocers/Elements/all_list_content.dart';
import 'package:grocers/Elements/baseAppbar.dart';
import 'package:grocers/Elements/drawers.dart';
import 'package:grocers/Screen/prodShowScr.dart';
import 'package:grocers/Screen/notificationScr.dart';
import 'package:grocers/Screen/prodDetails.dart';
import 'package:grocers/common/formfield.dart';
import 'package:grocers/utils/common.dart';
import 'package:grocers/utils/style.dart';

import '../common/button.dart';
import '../scrpart/imgslider.dart';
import 'category.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             // automaticallyImplyLeading: false,
//             floating: true,
//             pinned: true,
//             snap: false,
//             centerTitle: false,
//             title: Text('Kindacode.com'),
//             actions: [
//               IconButton(
//                 icon: Icon(Icons.shopping_cart),
//                 onPressed: () {},
//               ),
//             ],
//             bottom: PreferredSize(
//               preferredSize: Size.fromHeight(50),
//               child: Container(
//                 margin: EdgeInsets.only(left: 20, right: 20, bottom: 5),
//                 height: 38,
//                 color: Colors.white,
//                 child: Center(
//                   child: TextField(
//                     decoration: InputDecoration(
//                         hintText: 'Search for something',
//                         prefixIcon: Icon(Icons.search),
//                         suffixIcon: Icon(Icons.camera_alt)),
//                   ),
//                 ),
//               ),
//             ),
//             //  Container(
//             //     width: double.infinity,
//             //     height: 40,
//             //     color: Colors.white,
//             //     child: Center(
//             //       child: TextField(
//             //         decoration: InputDecoration(
//             //             hintText: 'Search for something',
//             //             prefixIcon: Icon(Icons.search),
//             //             suffixIcon: Icon(Icons.camera_alt)),
//             //       ),
//             //     ),

//             // ),
//           ),
//           // Other Sliver Widgets
//           SliverList(
//             delegate: SliverChildListDelegate([
//               ImgSlider(),
// //               heightSizedBox(20.0),

//               // Container(
//               //   height: 400,
//               //   child: Center(
//               //     child: Text(
//               //       'This is an awesome shopping platform',
//               //     ),
//               //   ),
//               // ),
//               // Container(
//               //   height: 1000,
//               //   color: Color.fromARGB(255, 172, 117, 135),
//               // ),
//             ]),
//           ),

//           SliverToBoxAdapter(
//               child: SingleChildScrollView(
//                   child: Container(height: 100.0, child: CategoryListItem()))),
//         ],
//       ),
//       drawer: DrawerScreen(),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: BaseAppBar(
        // boolLeading: false,
        leading: IconButton(
          icon: Icon(Icons.account_circle_rounded),
          // onPressed: () => Scaffold.of(context).openDrawer(),
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: 'Hey, Username',
        centerTitle: true,
        actionList: [
          IconBtn(
            onPressed: () => navigationPush(context, NotificationScreen()),
            icon: Icons.notifications,
            size: 20,
            color: txtWhiteColor,
          )
        ],
      ),
      drawer: DrawerScreen(),
      body: SingleChildScrollView(
        child: Column(
          //   ListView(
          // shrinkWrap: true,
          children: [
            heightSizedBox(5.0),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: AddressPart(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 43.0),
                  child: SearchPart(),
                ),
              ],
            ),
            ListView(shrinkWrap: true, children: [
              heightSizedBox(20.0),
              ImgSlider(),
              heightSizedBox(20.0),
              CategoryListItem(),
              heightSizedBox(20.0),
              HomeProdGridList(),
            ]),
          ],
        ),
      ),
    );
  }
}

// 1 Search and Address Part
class SearchPart extends StatelessWidget {
  const SearchPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 15.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(246, 246, 246, 255),
          border: Border.all(width: .5),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.only(left: 15),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search here',
            // prefixIcon: Icon(Icons.search),
            suffixIcon: IconBtn(
              icon: Icons.search,
              color: blackColor,
            ),
          ),
        ),
      ),
    );
  }
}

// ! Address Part in Home
class AddressPart extends StatelessWidget {
  final Widget? trailing;
  const AddressPart({Key? key, this.trailing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Color.fromARGB(246, 246, 246, 255),
      //   border: Border.all(width: .5),
      //   borderRadius: BorderRadius.circular(5),
      // ),
      // padding: EdgeInsets.all(0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        // Container(
        //   color: Color.fromARGB(255, 152, 166, 45),
        //   padding: EdgeInsets.all(.3),
        //   child: IconBtn(
        //     color2: offWhiteColor,
        //     color: offWhiteColor,
        //     icon: Icons.location_on_outlined,
        //   ),
        // ),

        Row(
          children: [
            ImgIcon(
              src: 'assets/icons/location-icon.png',
              width: 30,
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Txt(
                    t: 'Your Location',
                    fontSize: 13,
                  ),
                  Txt(t: '48,2nd floor ,jagatpura,Jaipur'),
                ],
              ),
            ),
          ],
        ),
        Container(
            alignment: Alignment.topRight,
            child:
                trailing != null ? IconBtn(icon: Icons.chevron_right) : null),
      ]),
    );
  }
}

// !  Vertical list for Category
class CategoryListItem extends StatelessWidget {
  CategoryListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ! Title Value
              Txt(
                t: 'Shop By Category',
                color: redColor,
                fontSize: 17,
              ),
              //  padding: EdgeInsets.all(10),
              Btn(
                padding: EdgeInsets.only(left: 6, right: 6),
                height: 30,
                btnName: 'VIEW ALL',
                style: TextStyle(fontSize: 13, color: blackColor),
                color: Color.fromARGB(246, 200, 200, 214),
                onTap: () => navigationPush(context, CategoryScreen()),
              ),
            ],
          ),
        ),
        Container(
          height: 130,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 15,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 8, right: 8, bottom: 5),
                child: InkWell(
                  onTap: () => navigationPush(context, ProductShowScreen()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // ! Pic Section
                      Container(
                        child: Image.asset(
                          'assets/images/snacks.png',
                          height: 80,
                        ),
                      ),

                      // ! Bottom Name
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Txt(
                          t: 'name $i',
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// Product GridList
class HomeProdGridList extends StatelessWidget {
  HomeProdGridList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // shrinkWrap: true,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Txt(
              t: 'Exclusive Products',
              color: redColor,
              fontSize: 17,
            ),
          ),
          Container(
            child: GridView.builder(
              // primary: false,
              padding: EdgeInsets.all(1.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / .99
                    // 1.2
                    ),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (context, i) {
                return HomeGridProdList(
                  onPressed: () => print('add tocart'),
                  onTap: () => navigationPush(context, ProductDetailScr()),
                  imageUrl: 'assets/images/snacks.png',
                  name: 'productname',
                  slug: 'uslug',
                  desc: 'Qunatity ',
                  price: '500',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
