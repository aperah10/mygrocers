import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImgSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> list = [1, 2, 3, 4, 5];
    return Container(
        child: CarouselSlider(
      options: CarouselOptions(
        height: 150,
        // aspectRatio: 16 / 9,
        // viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        autoPlayAnimationDuration: Duration(milliseconds: 200),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        // onPageChanged: callbackFunction,
        scrollDirection: Axis.horizontal,
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width / 1.25,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(),
                child: Image.asset(
                  'assets/icons/banner-img.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ));
          },
        );
      }).toList(),
    ));
  }
}

// ! Image Icon in Flutter

class ImgIcon extends StatelessWidget {
  final String? src;
  final double? width;
  final double? height;
  final double? cwidth;
  final double? cheight;
  final BoxFit? fit;
  final bool? imgType;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  const ImgIcon(
      {Key? key,
      this.cheight,
      this.fit,
      this.cwidth,
      this.height,
      this.src,
      this.imgType = false,
      this.padding,
      this.margin,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: cwidth,
      height: cheight,
      child: imgType == true
          ? Image.network(
              src!,
              width: width,
              height: height,
              fit: fit,
            )
          : Image.asset(
              src!,
              width: width,
              height: height,
              fit: fit,
            ),
    );
  }
}

//  IMAGE HORIZONTAL LIST
class ImgHorizontalList extends StatelessWidget {
  final dynamic prodList;
  final dynamic callBack;
  final dynamic itemBorder;
  const ImgHorizontalList(
      {Key? key, this.itemBorder, this.prodList, this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      // color: Colors.red,
      height: 55,
      width: double.infinity,
      child: ListView.builder(
          itemCount: prodList.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                callBack(prodList[i]);
                // print('pics ${prodList[i]}');
              },
              child: Container(
                decoration: prodList[i] == itemBorder
                    ? BoxDecoration(
                        border: Border.all(width: 1, color: Colors.green),
                        borderRadius: BorderRadius.circular(5))
                    : null,
                child: ImgIcon(
                  margin: EdgeInsets.all(3),
                  src: '${prodList[i]}',
                  width: 50,
                  height: 50,
                ),
              ),
            );
          }),
    );
  }
}
