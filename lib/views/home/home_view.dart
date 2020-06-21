library home_view;

import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/core/provider/view_state_widget.dart';
import 'package:flutter_wanandroid/view_model/home_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: ViewModelBuilder<HomeModel>.reactive(
        viewModelBuilder: () => HomeModel(),
        onModelReady: (model) => model.initData(),
        builder: (context, model, child) {
          if (model.busy) {
            return ViewStateBusyWidget();
          }
          return CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Text(model.homeAccounts[0].name),
              ),
            ],
          );
        },
      ),
    );
  }
}
