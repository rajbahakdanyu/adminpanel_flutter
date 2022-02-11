import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  int page = 0;
  String pageName = "Dashboard";

  void changePage(
    int pageNo,
    String name,
  ) {
    page = pageNo;
    pageName = name;
    notifyListeners();
  }
}
