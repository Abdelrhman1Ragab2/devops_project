import 'package:flutter/material.dart';


class Terraform extends StatelessWidget {
  const Terraform({Key? key}) : super(key: key);
  static const routeName = "Terraform";

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: const Text("Terraform"),
          centerTitle: true,
        ),
        body: buildBody(context));
  }

  Widget buildBody(
      BuildContext context) {
    return const Center(child: Text("we will build this part later.."));
  }

}
