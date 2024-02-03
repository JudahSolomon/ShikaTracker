import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageNavigator {
  PageNavigator({this.context});
  BuildContext? context;

  ///Navigator to next page
  Future nextPage({Widget? page}) {
    return Navigator.push(
        context!, CupertinoPageRoute(builder: ((context) => page!)));
  }

  void nextPageOnly({Widget? page}) {
    Navigator.pushAndRemoveUntil(context!,
        MaterialPageRoute(builder: (context) => page!), (route) => false);
  }
}
