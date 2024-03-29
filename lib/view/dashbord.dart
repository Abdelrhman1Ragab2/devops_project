import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../controller/menu_provider.dart';
import 'menu/menu_ui.dart';

class DashBord extends StatelessWidget {
  const DashBord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int currentIndex = Provider.of<MenuProvider>(context).menusSelectedIndex;
    return Scaffold(
      body: buildBody(context,currentIndex),
    );
  }

  List <BottomNavigationBarItem> bottomNavigationBarItemBody(BuildContext context){
    List <BottomNavigationBarItem> items=[];
    Provider.of<MenuProvider>(context).menus.forEach((element) {
      items.add(BottomNavigationBarItem(icon:Icon(element.icon),label: element.title ));
    });
    return items;
  }

  Widget buildBody(BuildContext context,int currentIndex) {
    return Row(
      children: [
         Expanded(flex: 1, child: menuBody()),
         Expanded(flex: 5, child: homeBody(context,currentIndex)),
      ],
    );
  }

  Widget menuBody() {
    return const MenuUI();
  }

  Widget homeBody(BuildContext context,int index) {
    return SizedBox(
      height: double.maxFinite,
        child: Provider.of<MenuProvider>(context).screens[index]);
  }


}
