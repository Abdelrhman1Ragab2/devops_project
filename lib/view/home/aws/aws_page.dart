import 'package:flutter/material.dart';


class AWS extends StatelessWidget {
  const AWS({Key? key}) : super(key: key);
  static const routeName = "AWS";

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: const Text("AWS"),
          centerTitle: true,
        ),
        body: buildBody(context));
  }

  Widget buildBody(
      BuildContext context) {
    return const Center(child: Text("we will build this part later.."));
  }

}
