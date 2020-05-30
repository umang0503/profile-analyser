import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:github/api.dart';
import 'package:flutter/material.dart';
import'dart:async';

import 'mod.dart';

class UserProviders2 with ChangeNotifier {


  List<Follow>_follow=[];

  List<Follow> get followpost =>_follow;


  set followpost(List<Follow>val){
    _follow = val;
    notifyListeners();
  }

  Future<void>getfollow(String username) async {
    final url3 = '${Api.api}/users/$username/followers';
    try {
      final response = await http.get(url3, headers: {'Authorization': 'token ${Api.token}'});
      final res = jsonDecode(response.body);
      List<Follow> data=[];

      for(var i=0;i<res.length;i++){
        var follow=Follow.fromJson(res[i]);
        data.add(follow);
      }
      followpost=data;
      return followpost;

    } catch (e) {
      print(e);
    }
  }
}