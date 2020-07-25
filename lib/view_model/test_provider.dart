import 'package:flutter_wanandroid/core/provider/view_state_model.dart';

class TestLikeCount extends ViewStateModel {
  int _count = 0;

  int get count => _count;

  updateLikeCount() {
    _count++;
    notifyListeners();
  }

  // TODO
  initData() {
    _count = 0;
  }
}
