import 'package:flutter_wanandroid/core/provider/view_state_list_model.dart';

abstract class ViewStateRefreshListModel<T> extends ViewStateListModel<T> {
  /// 分页第一页页码
  static const int pageNumFirst = 0;

  /// 分页条目数量
  static const int pageSize = 20;

  /// 当前页码
  int _currentPageNum = pageNumFirst;

  @override
  Future<List<T>> refresh({bool init = false}) async {}

  Future<List<T>> loadMore() async {}

  Future<List<T>> loadData({int pageNum});

  @override
  void dispose() {
    super.dispose();
  }
}
