import 'package:flutter/material.dart';

class TabScaffold extends StatelessWidget {
  final String title;
  final List<Tab> tabs;
  final List<Widget> tabsViews;
  final Function(BuildContext) callback;

  final _scaffoldState = GlobalKey<ScaffoldState>();

  TabScaffold({
    @required this.title,
    @required this.tabs,
    @required this.tabsViews,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        key: _scaffoldState,
        appBar: AppBar(
          title: Text(title),
          bottom: TabBar(
            tabs: tabs,
          ),
          actions: [
            if (callback != null)
              IconButton(
                icon: Icon(Icons.group_add),
                onPressed: () => callback(context),
              ),
          ],
        ),
        body: TabBarView(
          children: tabsViews,
        ),
      ),
    );
  }
}
