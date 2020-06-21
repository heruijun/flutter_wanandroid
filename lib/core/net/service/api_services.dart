import 'package:flutter_wanandroid/core/models/banner.dart';
import 'package:flutter_wanandroid/core/models/home_account.dart';
import 'package:flutter_wanandroid/core/net/app_api.dart';

class WanAndroidRepository {
  // 轮播
  static Future fetchBanners() async {
    var response = await httpManager.get('banner/json');
    return response.data
        .map<Banner>((item) => Banner.fromJsonMap(item))
        .toList();
  }

  // 获取公众号列表
  static Future fetchWxarticle() async {
    var response = await httpManager.get('wxarticle/chapters/json');
    return response.data
        .map<HomeAccount>((item) => HomeAccount.fromJson(item))
        .toList();
  }
}
