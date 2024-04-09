
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
  final String apiUrl = 'https://l07us1b8rc.execute-api.eu-west-1.amazonaws.com';

// Function to add a user
  Future<void> addUser(User user) async {
    final response = await http.post(
      Uri.parse('$apiUrl/dev-web-guide'),
      headers: {'Content-Type': 'application/json','x-api-key':'WpuUTxgUwdNwSOlssfq5aY1p2T1yiOt9dkNhN7Ve'},
      body: jsonEncode(User.toJson(user)),
    );

    if (response.statusCode == 200) {
      print('User added successfully!');
    } else {
      print('Failed to add user. Status code: ${response.statusCode}');
      print('Error message: ${response.body}');
    }
  }

  Future<List<User>> getAllUsers() async {
    List<User> usersList = [];
    try {
      final dio = Dio();
      final response = await dio.get('https://l07us1b8rc.execute-api.eu-west-1.amazonaws.com/dev-web-guide1');

      if (response.statusCode == 200) {
        final users = List<Map<String, dynamic>>.from(response.data);
        for (var user in users) {
          usersList.add(User.fromJson(user));
        }
      } else {
        print('Failed to get users. Status code: ${response.statusCode}');
        print('Error message: ${response.data}');
      }

      return usersList;
    } catch (e) {
      print('Error loading data: $e');
      throw Exception('Failed to load users');
    }
  }

// // Function to get all users
//   Future<List<User>> getAllUsers() async {
//     List<User> usersList = [];
//     try {
//       final response = await http.get(Uri.parse('https://l07us1b8rc.execute-api.eu-west-1.amazonaws.com/dev-web-guide1'));
//
//
//       if (response.statusCode == 200) {
//         final users = jsonDecode(response.body);
//         for (var user in users) {
//           usersList.add(User.fromJson(user));
//         }
//       } else {
//         print('Failed to get users. Status code: ${response.statusCode}');
//         print('Error message: ${response.body}');
//       }
//
//       return usersList;
//     }
//     catch(e){
//       print ( "error to load data"+e.toString());
//     }
//     return usersList;
//   }
}