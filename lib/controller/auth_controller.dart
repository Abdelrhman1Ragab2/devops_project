import 'package:flutter/cupertino.dart';
import 'package:network/view/auth/login.dart';

import '../view/auth/activity.dart';
import '../view/auth/members.dart';
import '../view/auth/register.dart';

class AuthProvider with ChangeNotifier{

  int itemSelectedIndex=0;
  void changeMenuIndex(int index){
    itemSelectedIndex=index;
    notifyListeners();
  }

  List<Widget> screens=const [ LoginPage(),GroupMembersPage(),ActivityPage(),RegisterPage()];



}