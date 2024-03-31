
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../controller/menu_provider.dart';
import '../../core/widget/my_text.dart';
import '../../model/menu_model.dart';

class MenuUI extends StatelessWidget {
  const MenuUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  Widget buildBody(BuildContext context){
    return Container(
      height: double.infinity,
      color: Theme.of(context).primaryColor.withOpacity(0.9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Image.asset("assets/images/jenkins.png"),
          Expanded(child: menusBody(context))
        ],
      ),
    );

  }

  Widget menusBody(BuildContext context){
    return ListView.separated(itemBuilder: (context,index)=>itemBody(context,Provider.of<MenuProvider>(context).menus[index],index),
        separatorBuilder: (_,__)=>const SizedBox(height: 5,),
        itemCount: Provider.of<MenuProvider>(context).menus.length);
  }

  Widget itemBody(BuildContext context,MenuModel menu,index){
    return Card(
      elevation: 20,
      color: index==Provider.of<MenuProvider>(context).menusSelectedIndex?Colors.grey: Theme.of(context).secondaryHeaderColor,
      margin: const EdgeInsets.all(4.0),
      child: ListTile(
        title:myText(menu.title,size: 18) ,
        trailing: Image.asset(menu.image),
        onTap: (){
          Provider.of<MenuProvider>(context,listen: false).changeMenuIndex(index);
        },

      ),
    );
  }
}
