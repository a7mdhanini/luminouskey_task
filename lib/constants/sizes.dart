import 'package:flutter/material.dart';

class Sizes {
  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double allSize(BuildContext context) {
    return height(context) + width(context);
  }

  static double statusBarHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  static double availableHeight(BuildContext context) {
    final availableH = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        35 -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
    return availableH;
  }
}
