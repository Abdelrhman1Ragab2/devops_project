
import 'package:flutter/material.dart';
import 'package:network/view/my_app.dart';
import 'package:provider/provider.dart';

import 'controller/menu_provider.dart';



void main() async{

  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider<MenuProvider>(create: (_)=>MenuProvider()),

          ],

          child:const MyApp()
      )
  );


}



