import 'package:flutter/material.dart';

class PageModel extends ChangeNotifier {
  int pageId = 0;

  void changePageId(int newId) {
    pageId = newId;
    notifyListeners();
  }
}
