import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:github/api.dart';
import 'package:flutter/material.dart';
import'dart:async';

import 'package:github/mod2.dart';

class UserProviders3 with ChangeNotifier {


  List<Following>_following=[];

  List<Following> get followingpost =>_following;


  set followingpost(List<Following>val){
    _following = val;
    notifyListeners();
  }

  Future<void>getfollowing(String username) async {
    final url3 = '${Api.api}/users/$username/following';
    try {
      final response = await http.get(url3, headers: {'Authorization': 'token ${Api.token}'});
      final res = jsonDecode(response.body);
      List<Following> data=[];

      for(var i=0;i<res.length;i++){
        var following=Following.fromJson(res[i]);
        data.add(following);
      }
      followingpost=data;
      return followingpost;

    } catch (e) {
      print(e);
    }
  }
}