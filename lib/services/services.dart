import 'dart:convert';

import 'package:http/http.dart';
import 'package:practice/model/user_model.dart';

abstract class WebServices {
  Future<List<UserModel>> getUsers();
}

class Users implements WebServices {
  String endpoint = 'https://reqres.in/api/users?page=2';
  @override
  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
