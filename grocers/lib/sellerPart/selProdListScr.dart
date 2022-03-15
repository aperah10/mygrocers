import 'package:flutter/material.dart';
import 'package:grocers/Screen/wishlistScr.dart';
import 'package:grocers/scrpart/imgslider.dart';
import '../Elements/baseAppbar.dart';

class SelProdListScreen extends StatelessWidget {
  const SelProdListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        centerTitle: true,
        title: 'Seller Product List',
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
                    onTap: () {},
                    btnName: 'Edit',
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
