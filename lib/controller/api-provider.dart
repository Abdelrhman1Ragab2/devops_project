import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:network/model/users.dart';

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
  }

   Future<List<WebUser>> fetchUsers() async {
    final response = await http.get(Uri.parse('http://backend-service:3000/users'),
    headers: {
        "Access-Control-Allow-Origin": "*"
    }

    );
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<WebUser> users=[];
      for (var element in jsonData) {
        users.add(WebUser.fromJson(element));

      }
      print(users[0].email);
      return users;
    } else {
      throw Exception('Failed to fetch users');
    }
  }

  Future<void> registerWebUsers(Map user) async {
    print("the pass: ${user['password']} the email ${user['password']}");
    try {
      final response = await http.post(
          Uri.parse('http://backend-service:3000/users'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode(user)
      );
      print(response.statusCode);
      print(response.body);
      print(response.reasonPhrase);

      if (response.statusCode == 200) {
        print('User created: ${response.body}');
      } else {
        // Error creating user
        print('Error creating user: ${response.body}');
      }
    }
    catch (e) {
      print(e.toString());
    }
  }

  Future<Map<String,dynamic>> loginUser(String email, String password) async {

      List<WebUser> users= await fetchUsers();
      Map<String,dynamic> output={};
      for (var element in users) {
        print("${element.email} ${element.password}");
        if(element.email==email && element.password==password){
          output.addAll({
            "auth":true,
          });
        break;
        }

        else{
          output.addAll({
            "auth":false,
          });
        }
      }
      print(output);
      return output;
  }


  
  
  }