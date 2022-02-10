import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  int page = 0;

  void changePage(int pageNo) {
    page = pageNo;
    notifyListeners();
  }
}
