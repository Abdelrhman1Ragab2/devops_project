import 'package:flutter/material.dart';


class Docker extends StatelessWidget {
  const Docker({Key? key}) : super(key: key);
  static const routeName = "Docker";

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: const Text("Docker"),
          centerTitle: true,
        ),
        body: buildBody(context));
  }

  Widget buildBody(
      BuildContext context) {
    return const Center(child: Text("we will build this part later.."));
  }

}
