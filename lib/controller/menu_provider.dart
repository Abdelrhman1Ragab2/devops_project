import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network/view/home/agile/agile_page.dart';
import 'package:network/view/home/aws/aws_page.dart';
import 'package:network/view/home/kupernetes/kubernetes_page.dart';
import 'package:network/view/home/terraform/terraform_page.dart';

import '../model/menu_model.dart';
import '../view/home/Jenkins/jenkins.dart';
import '../view/home/about/about_page.dart';
import '../view/home/ansible/ansible_page.dart';
import '../view/home/docker/docker_page.dart';
import '../view/home/linux/linux_page.dart';
import '../view/home/python/python_page.dart';
import '../view/home/services/services_page.dart';

class MenuProvider with ChangeNotifier{

  int menusSelectedIndex=0;
  void changeMenuIndex(int index){
    menusSelectedIndex=index;
   notifyListeners();
  }
  List<MenuModel> menus=[
    MenuModel(title: "About", image: "assets/images/team1.png"),
    MenuModel(title: "Linux", image: "assets/images/linux.png",),
    MenuModel(title: "Jenkins", image: "assets/images/jenkins1.png",),
    MenuModel(title: "Python", image: "assets/images/python1.png",),
    MenuModel(title: "Docker", image:"assets/images/docker1.png"),
    MenuModel(title: "Kubernetes", image: "assets/images/download.png"),
    MenuModel(title: "Agile", image: "assets/images/agile.png"),
    MenuModel(title: "AWS", image: "assets/images/aws.png"),
    MenuModel(title: "Ansible", image: "assets/images/ansible.png"),
    MenuModel(title: "Terraform", image: "assets/images/terraform.png"),
  ];

  List<Widget> screens=const[ AboutPage(),Linux(),Jenkins(),Python(),Docker(),Kubernetes(),Agile(),AWS(),Ansible(),Terraform()];



}