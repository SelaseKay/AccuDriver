import 'package:accudriver/roadsign.dart';
import 'package:flutter/material.dart';

import 'custom_widget/signcard.dart';

// ignore: camel_case_types
class signscreenmod extends StatelessWidget {
  const signscreenmod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemBuilder: (context, index) =>
                    Signcard(roadsign: signs[index]),
                itemCount: signs.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.75,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 1),
              ),
            ),
          ),
        ],
      ),
      Column(
        children: <Widget>[
          GridView.builder(
            itemCount: 6,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              return Card();
            },
          ),
        ],
      ),
      Center(
        child: Icon(
          Icons.cloud,
          size: 64.0,
          color: Colors.teal,
        ),
      ),
    ];
    final _kTabs = <Tab>[
      Tab(icon: Icon(Icons.cloud), text: 'Prohibitory Signs'),
      Tab(icon: Icon(Icons.cloud), text: 'Mandatory'),
      Tab(icon: Icon(Icons.cloud), text: 'Warning'),
    ];
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Road Signs'),
          backgroundColor: Colors.cyan,
          bottom: TabBar(
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );
  }
}
