import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:final_project/services/get_users.dart';

class UserService{
  final String baseUrl = 'https://reqres.in/api' ;

  Future<List<GetUsers>> fetchUser() async {
    final response = await http.get(Uri.parse('$baseUrl/users?page=1'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> usersJson = data['data'];

      return usersJson.map((json) => GetUsers.fromJson(json)).toList();
    }else{
      throw Exception('failed to load users');
    }

  }
}