import 'package:flutter/material.dart';
import 'package:github/home.dart';
import 'package:github/https.dart';
import 'package:github/https2.dart';

import'package:provider/provider.dart';

import 'https3.dart';
import 'hello.dart';




void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: UserProvider()),
          ChangeNotifierProvider.value(value: UserProviders()),
          ChangeNotifierProvider.value(value: UserProviders2()),
          ChangeNotifierProvider.value(value: UserProviders3()),

        ],
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

