// /users	GET 유저 목록
// /users	POST	유저 생성
// /users/:id	GET	유저 조회
// /users/:id	PUT	유저 수정
// /users/:id	DELETE	유저 삭제

import 'dart:convert';

import 'package:flutter_application_1/user.dart';
import 'package:http/http.dart' as http;

const String baseUrl = "https://koreanjson.com";

Future<List<User>> getUser() async {
  final response = await http.get(Uri.parse("$baseUrl/users"));

  if (response.statusCode != 200) {
    throw Exception("Failed to load users");
  }

  List<dynamic> json = jsonDecode(response.body);

  List<User> users = [];
  for (var user in json) {
    users.add(User.fromJson(user));
  }

  return users;
}
