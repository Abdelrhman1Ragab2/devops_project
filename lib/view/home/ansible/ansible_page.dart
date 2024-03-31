import 'package:flutter/material.dart';


class Ansible extends StatelessWidget {
  const Ansible({Key? key}) : super(key: key);
  static const routeName = "Ansible";

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: const Text("Ansible"),
          centerTitle: true,
        ),
        body: buildBody(context));
  }

  Widget buildBody(
      BuildContext context) {
    return const Center(child: Text("we will build this part later.."));
  }

}
