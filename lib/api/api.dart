import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:list_apps/model/user_model.dart';

class ApiService {
  Future<List<UserModel>> fetchUsers({required int page}) async {
    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=$page'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => UserModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }
}

