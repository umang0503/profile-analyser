import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:github/api.dart';
import 'package:flutter/material.dart';
import'dart:async';

import 'modrep.dart';
class UserProviders with ChangeNotifier {


  List<Repo>_repo=[];

  List<Repo> get listpost =>_repo;


  set listpost(List<Repo>val){
    _repo = val;
   notifyListeners();
 }

  Future<void>getRepo(String username) async {
    final url2 = '${Api.api}/users/$username/repos';
    try {
      final response = await http.get(url2, headers: {'Authorization': 'token ${Api.token}'});
      final res = jsonDecode(response.body);
      List<Repo> data=[];

      for(var i=0;i<res.length;i++){
    var repo=Repo.fromJson(res[i]);
        data.add(repo);
      }
      listpost=data;
      return listpost;

    } catch (e) {
      print(e);
    }
  }
}