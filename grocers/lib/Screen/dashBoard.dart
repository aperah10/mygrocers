import 'package:flutter/material.dart';

import '../utils/style.dart';

class SellerDashboard extends StatefulWidget {
  final int? sellerId;
  int? currentTab;
  Widget? currentPage;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  SellerDashboard({Key? key, this.currentTab, this.sellerId}) {
    if (currentTab == null) currentTab = 0;
  }
  @override
  _SellerDashboardState createState() => _SellerDashboardState();
}

class _SellerDashboardState extends State<SellerDashboard> {
  @override
  initState() {
    super.initState();
    _selectTab(widget.currentTab!);
  }

  void _selectTab(int tabItem) {
    setState(() {
      widget.currentTab = tabItem;
      switch (tabItem) {
        case 0:
          // widget.currentPage = SellerHomeScr(
          //   sellerId: widget.sellerId,
          // );
          break;
        case 1:
          // widget.currentPage = SellerTrackOrderScr(
          //   sellerId: widget.sellerId,
          // );
          break;
        case 2:
          // widget.currentPage = SellerProgressScr(
          //   sellerId: widget.sellerId,
          // );
          break;
        case 3:
          // widget.currentPage = SelGeneratePromoCodes(sellerId: widget.sellerId);

          break;
        case 4:
          // widget.currentPage = Profile();
          // widget.currentPage = SelGeneratePromoCodes(sellerId: widget.sellerId);
          break;
        // case 5:
        //   widget.currentPage = Profile();
        //   break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      body: widget.currentPage,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: redColor,
        // selectedFontSize: 0,
        // unselectedFontSize: 0,
        unselectedItemColor: darkBlueColor,
        iconSize: 25,
        backgroundColor: Colors.white,
        currentIndex: widget.currentTab!,
        showSelectedLabels: true,
        selectedFontSize: 12,

        showUnselectedLabels: true,
        selectedLabelStyle: TextStyle(
            fontSize: 12, color: redColor, fontFamily: montserratMedium),

        unselectedLabelStyle: TextStyle(
            fontSize: 12, color: darkBlueColor, fontFamily: montserratMedium),
        unselectedFontSize: 12,

        onTap: (int i) {
          this._selectTab(i);
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/sell-food.png',
              height: 22,
              color: widget.currentTab == 0 ? redColor : darkBlueColor,
            ),
            label: 'Kitchen',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/track-order.png',
              height: 22,
              color: widget.currentTab == 1 ? redColor : darkBlueColor,
            ),
            label: 'Track Order',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/progress.png',
              height: 22,
              color: widget.currentTab == 2 ? redColor : darkBlueColor,
            ),
            label: 'Progress',
          ),
          // BottomNavigationBarItem(
          //   icon: Image.asset(
          //     'assets/icons/inbox.png',
          //     height: 22,
          //     color: widget.currentTab == 3 ? redColor : darkBlueColor,
          //   ),
          //   label: 'Chat',
          // ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/promo-code.png',
              height: 22,
              color: widget.currentTab == 3 ? redColor : darkBlueColor,
            ),
            label: 'Promo Code',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/profile.png',
              height: 22,
              color: widget.currentTab == 4 ? redColor : darkBlueColor,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
