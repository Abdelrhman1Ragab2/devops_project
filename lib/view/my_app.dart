import 'package:flutter/material.dart';

import 'auth/dash.dart';
import 'dashbord.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor:  Color.fromRGBO(
              10, 18, 60, 0.9),
        ),

        appBarTheme: const AppBarTheme(
          color:   Color.fromRGBO(
              10, 18, 60, 0.9),
        ),
        scrollbarTheme: ScrollbarThemeData(
          thumbVisibility: MaterialStateProperty.all<bool?>(true) ,
          thumbColor: MaterialStateProperty.all<Color>(Colors.grey)
        ),
        primaryColor: const Color.fromRGBO(
            5, 5, 24, 1.0),
        secondaryHeaderColor: const Color.fromRGBO(
            10, 18, 60, 0.9),
      ),

      routes:  {
        DashBord.routeName: (context) =>  const DashBord(),


      },

      // home: const DashBord(),
      home: const DashAuth(),
    );
  }
}
