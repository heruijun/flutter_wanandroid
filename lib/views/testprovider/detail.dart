import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/view_model/test_provider.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class LikeCountDetailPage extends StatefulWidget {
  @override
  _LikeCountDetailPageState createState() => _LikeCountDetailPageState();
}

class _LikeCountDetailPageState extends State<LikeCountDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('点赞详情')),
      body: Center(
        child: Text(context.watch<TestLikeCount>().count.toString()),
      ),
    );
  }
}
