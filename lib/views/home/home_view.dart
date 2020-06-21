library home_view;

import 'package:flutter/material.dart';
import 'package:flutter_wanandroid/core/models/home_account.dart';
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
              SliverToBoxAdapter(),
              SliverToBoxAdapter(
                child: Wrap(
                  children: model.homeAccounts?.map((HomeAccount o) {
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
