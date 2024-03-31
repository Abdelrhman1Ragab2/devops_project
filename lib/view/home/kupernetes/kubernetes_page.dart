import 'package:flutter/material.dart';


class Kubernetes extends StatelessWidget {
  const Kubernetes({Key? key}) : super(key: key);
  static const routeName = "Kubernetes";

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: const Text("Kubernetes"),
          centerTitle: true,
        ),
        body: buildBody(context));
  }

  Widget buildBody(
      BuildContext context) {
    return const Center(child: Text("we will build this part later.."));
  }

}
