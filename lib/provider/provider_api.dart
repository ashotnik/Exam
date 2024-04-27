import 'package:exam/models/model_user.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProvider with ChangeNotifier {
  List<User> _users = [];

  List<User> get users => _users;

  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/?results=5'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];

        _users = data.map((e) => User.fromJson(e)).toList();
      
      
      
      notifyListeners();
    } else {
      throw Exception('Failed to load users');
    }
  }
}
