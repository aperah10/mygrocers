import 'package:flutter/material.dart';
import 'package:grocers/utils/common.dart';

import '../Elements/all_list_content.dart';
import '../common/button.dart';
import '../utils/style.dart';
import 'prodShowScr.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);

  final List<Widget> tabs = [];

  // dynamic cart;

  // dynamic cartItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: true,
            title: Txt(t: 'All Category ', style: labelTextStyle),
            actions: [
              IconButton(
                icon: Icon(Icons.filter_list),
                onPressed: () {},
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40),
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, bottom: 1),
                padding: EdgeInsets.all(5),
                height: 38,
                color: Colors.white,
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search here',
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.camera_alt)),
                  ),
                ),
              ),
            ),
          ),
          // Other Sliver Widgets

          SliverPadding(
            padding: const EdgeInsets.all(5.0),
            sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.9),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return CategeoryGridProdList(
                    onTap: () => navigationPush(context, ProductShowScreen()),
                    imageUrl: 'assets/images/banana.png',
                    title: 'Categoryname',
                  );
                }, childCount: 10)),
          )
        ],
      ),
    );
  }
}
