import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/user.dart';

class ApiProvider with ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();


// API endpoint URL
  final String endPoint =
      'https://l07us1b8rc.execute-api.eu-west-1.amazonaws.com';

    Future<void> addUser(User user) async {
      final response = await http.post(
        Uri.parse('https://l07us1b8rc.execute-api.eu-west-1.amazonaws.com/final/'),
        headers: {
          'Content-Type': 'application/json',
          //'x-api-key': 'WpuUTxgUwdNwSOlssfq5aY1p2T1yiOt9dkNhN7Ve'
        },
        body: jsonEncode(User.toJson(user)),
      );

    if (response.statusCode == 200) {
      print('User added successfully!');
    } else {
      print('Failed to add user. Status code: ${response.statusCode}');
      print(response.body);
    }
  }

  Future<List<User>> getAllUsers() async {
    List<User> usersList = [User(userId: "Id", userName: "Name", userEmail: "Email", userPhone: "phone")];
    try {
      final dio = Dio();
      final response = await dio.get(
          'https://l07us1b8rc.execute-api.eu-west-1.amazonaws.com/dev-web-guide1');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.data['body']);
        final users = List<Map<String, dynamic>>.from(responseData);
        for (var user in users) {
          usersList.add(User.fromJson(user));
        }
      } else {
        print('Failed to get users. Status code: ${response.statusCode}');
      }
      return usersList;
    } catch (e) {
      print('Error loading data: $e');
      throw Exception('Failed to load users');
    }
  }

  Future<void> deleteUser(String userId) async {
    final response = await http.post(
      Uri.parse('https://bx0hiqz2h0.execute-api.eu-west-1.amazonaws.com/del/dev'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "body":{
          "userId":userId
        }
      }),
    );

    if (response.statusCode == 200) {
      print('User deleted successfully!');
      print(response.body);
    } else {
      print('Failed to delete user. Status code: ${response.statusCode}');

    }
  }}