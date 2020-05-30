import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:github/api.dart';
import 'package:github/model.dart';
import 'package:http/http.dart' as http;

import 'modrep.dart';

class UserProvider with ChangeNotifier {
  Article article;
  Repo repo;

  Future<void> getData(String username) async {
    final url = '${Api.api}/users/$username';
    try {
      final responce =
      await http.get(url, headers: {'Authorization': 'token ${Api.token}'});

      final responceData = json.decode(responce.body) as Map<String, dynamic>;


      article = Article(
        username: responceData['login'],
        imageUrl: responceData['avatar_url'],
        followers: responceData['followers'],
        followings: responceData['following'],
        public_repo: responceData['public_repos'],
        joined_date: responceData['created_at'],
        bio: responceData['bio'],
      );

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
  }