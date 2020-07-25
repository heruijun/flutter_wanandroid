import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/core/locator.dart';
import 'package:flutter_wanandroid/core/services/navigator_service.dart';
import 'package:flutter_wanandroid/view_model/test_provider.dart';
import 'package:flutter_wanandroid/views/testprovider/detail.dart';
import 'package:provider/provider.dart';

class IndexProviderPage extends StatefulWidget {
  @override
  _IndexProviderPageState createState() => _IndexProviderPageState();
}

class _IndexProviderPageState extends State<IndexProviderPage> {
  @override
  Widget build(BuildContext context) {
    var count = context.watch<TestLikeCount>();

    return Container(
        child: Column(
      children: <Widget>[
        Text(count.count.toString()),
        InkWell(
            child: Text('点赞'),
            onTap: () => context.read<TestLikeCount>().updateLikeCount()),
        InkWell(
          child: Text('查看详情'),
          onTap: () => locator<NavigatorService>()
              .navigatorKey
              .currentState
              .push(new MaterialPageRoute(
            builder: (_) {
              return LikeCountDetailPage();
            },
          )),
        )
      ],
    ));
  }
}
