import 'package:flutter/material.dart';


class Linux extends StatelessWidget {
  const Linux({Key? key}) : super(key: key);
  static const routeName = "Linux";

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: const Text("Linux"),
          centerTitle: true,
        ),
        body: buildBody(context));
  }

  Widget buildBody(
      BuildContext context) {
    return Center(child: Text(" Linux "));
  }

}
