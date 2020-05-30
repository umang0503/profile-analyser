import 'package:flutter/material.dart';
import 'package:github/Repository.dart';
import 'package:github/follower.dart';

import 'test.dart';

class TabBarDemo extends StatelessWidget {
  String username3;
  TabBarDemo({this.username3});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(child: Text('Repository'),),
                Tab(child: Text('Follower')),
                Tab(child: Text('Following')),
              ],
            ),
            title: Center( child:Text(username3)),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    Color.fromRGBO(143, 148, 251, 1),
                    Color.fromRGBO(143, 148, 251, .6)
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [git_Repo(username2:username3 ,),

              followers(username4:username3 ,),
              last_tab(username5: username3,)
            ],
          ),
        ),
      ),
    );
  }
}