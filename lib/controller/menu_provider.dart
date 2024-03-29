import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/menu_model.dart';
import '../view/home/Jenkins/jenkins.dart';
import '../view/home/about/about_page.dart';
import '../view/home/linux/linux_page.dart';
import '../view/home/services/services_page.dart';

class MenuProvider with ChangeNotifier{

  int menusSelectedIndex=0;
  void changeMenuIndex(int index){
    menusSelectedIndex=index;
   notifyListeners();
  }
  List<MenuModel> menus=[
    MenuModel(title: "About", icon: Icons.summarize_outlined),
    MenuModel(title: "Linux", icon: Icons.notes,),
    MenuModel(title: "Jenkins", icon: Icons.task_alt,),
    MenuModel(title: "Docker", icon: Icons.notes,),
    MenuModel(title: "Kubernetes", icon: Icons.task_alt,),
    MenuModel(title: "Agile", icon: Icons.summarize_outlined),
    MenuModel(title: "AWS", icon: Icons.notes,),
    MenuModel(title: "Ansible", icon: Icons.task_alt,),
    MenuModel(title: "Terraform", icon: Icons.task_alt,),
  ];

  List<Widget> screens=const[ AboutPage(),Linux(),Jenkins(),Services(),Services(),Services(),Services(),Services(),Services()];



}