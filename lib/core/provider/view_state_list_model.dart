import 'package:flutter_wanandroid/core/base/base_view_model.dart';

abstract class ViewStateListModel<T> extends BaseViewModel {
  /// 页面数据
  List<T> list = [];

  /// 第一次进入页面loading skeleton
  initData() async {
    await refresh(init: true);
  }

  // 下拉刷新
  refresh({bool init = false}) async {}

  // 加载数据
  Future<List<T>> loadData();

  onCompleted(List<T> data) {}
}
