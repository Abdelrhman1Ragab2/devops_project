import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../controller/menu_provider.dart';
import '../core/widget/custom_drawer.dart';
import 'menu/menu_ui.dart';

class DashBord extends StatelessWidget {
  const DashBord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMobile=MediaQuery.of(context).size.width<=700;
    print(MediaQuery.of(context).size.width);
    int currentIndex = Provider.of<MenuProvider>(context).menusSelectedIndex;
    return Scaffold(
      body: isMobile?buildBodyMobile(context,currentIndex):buildBodyWeb(context,currentIndex),
      appBar: isMobile?AppBar():null,
      endDrawer: isMobile?const MyDrawer():null,
    );
  }

  List <BottomNavigationBarItem> bottomNavigationBarItemBody(BuildContext context){
    List <BottomNavigationBarItem> items=[];
    Provider.of<MenuProvider>(context).menus.forEach((element) {
      items.add(BottomNavigationBarItem(icon:Image.asset(element.image),label: element.title ));
    });
    return items;
  }

  Widget buildBodyWeb(BuildContext context,int currentIndex) {
    return Row(
      children: [
         Expanded(flex: 1, child: menuBody()),
         Expanded(flex: 5, child: homeBody(context,currentIndex)),
      ],
    );
  }
  Widget buildBodyMobile(BuildContext context,int currentIndex) {
    return
          homeBody(context,currentIndex);
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
