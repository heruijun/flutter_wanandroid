import 'package:flutter_wanandroid/core/base/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  String title = 'default';

  void initialise() {
    title = 'initialised';
    notifyListeners();
  }

  int counter = 0;

  void updateTitle() {
    counter++;
    title = '$counter';
    notifyListeners();
  }
}
