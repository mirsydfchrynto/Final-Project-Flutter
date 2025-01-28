import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:final_project/services/get_users.dart';

class UserService {
  final String baseUrl = 'https://reqres.in/api';

  Future<List<GetUsers>> fetchUser () async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users?page=1'));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<GetUsers> users = (data['data'] as List)
            .map((user) => GetUsers.fromJson(user))
            .toList();
        return users;
      } else {
        print('Failed to load data: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }
}