import 'package:flutter/material.dart';
import '../utils/style.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar = AppBar();

  final double? elevation;
  final bool? boolLeading;
  final bool? centerTitle;
  final Widget? leading;
  final Function? onTap;
  final String? title;
  final List<Widget>? actionList;
  final Color? bgColor;

  BaseAppBar(
      {this.boolLeading,
      this.elevation,
      this.leading,
      this.centerTitle,
      this.onTap,
      this.title,
      this.bgColor,
      this.actionList});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor ?? offWhiteColor,
      elevation: elevation,
      automaticallyImplyLeading: boolLeading ?? true,
      leading: leading,
      title: title != null
          ? Text(title!,
              style:
                  TextStyle(fontFamily: montserratMedium, color: Colors.orange))
          : null,
      centerTitle: centerTitle ?? false,
      actions: actionList,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
