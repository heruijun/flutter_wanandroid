library home_view;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_wanandroid/core/models/home_account.dart';
import 'package:flutter_wanandroid/core/provider/view_state_widget.dart';
import 'package:flutter_wanandroid/view_model/home_model.dart';
import 'package:flutter_wanandroid/widgets/animated_provider.dart';
import 'package:flutter_wanandroid/widgets/banner_image.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bannerHeight = MediaQuery.of(context).size.width * 5 / 11;
    return Scaffold(
      body: ViewModelBuilder<HomeModel>.reactive(
        viewModelBuilder: () => HomeModel(),
        onModelReady: (model) => model.initData(),
        builder: (context, model, child) {
          if (model.isBusy) {
            return ViewStateBusyWidget();
          }
          var homeAccounts = model?.homeAccounts ?? [];
          return CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                // 加载中并且亮色模式下,状态栏文字为黑色
                brightness: Theme.of(context).brightness == Brightness.light &&
                        model.isBusy
                    ? Brightness.light
                    : Brightness.dark,
                flexibleSpace: FlexibleSpaceBar(
                  background: BannerWidget(),
                  centerTitle: true,
                  title: EmptyAnimatedSwitcher(
                    display: false,
                    child: Text('玩 Android'),
                  ),
                ),
                expandedHeight: bannerHeight,
                pinned: true,
              ),
              SliverToBoxAdapter(
                child: Wrap(
                  children: homeAccounts.map((HomeAccount o) {
                    return Container(
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      child: FlatButton(
                        child:
                            Text(o.name, style: TextStyle(color: Colors.white)),
                        color: Theme.of(context).primaryColor,
                        onPressed: () => null,
                      ),
                    );
                  })?.toList(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Consumer<HomeModel>(builder: (_, homeModel, __) {
        if (homeModel.isBusy) {
          return CupertinoActivityIndicator();
        } else {
          var banners = homeModel?.banners ?? [];
          return Swiper(
            loop: true,
            autoplay: true,
            autoplayDelay: 5000,
            pagination: SwiperPagination(),
            itemCount: banners.length,
            itemBuilder: (ctx, index) {
              return InkWell(
                  onTap: () {
                    var banner = banners[index];
                  },
                  child: BannerImage(banners[index].imagePath));
            },
          );
        }
      }),
    );
  }
}
