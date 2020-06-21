import 'package:flutter_wanandroid/core/models/banner.dart';
import 'package:flutter_wanandroid/core/models/home_account.dart';
import 'package:flutter_wanandroid/core/net/service/api_services.dart';
import 'package:flutter_wanandroid/core/provider/view_state_model.dart';

class HomeModel extends ViewStateModel {
  List<HomeAccount> _homeAccounts;

  List<HomeAccount> get homeAccounts => _homeAccounts;

  List<Banner> _banners;

  List<Banner> get banners => _banners;

  initData() async {
    busy = true;
    // _homeAccounts = await WanAndroidRepository.fetchWxarticle();
    _banners = await WanAndroidRepository.fetchBanners();
    busy = false;
  }
}
