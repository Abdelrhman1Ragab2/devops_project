import 'package:flutter/material.dart';


class Agile extends StatelessWidget {
  const Agile({Key? key}) : super(key: key);
  static const routeName = "Agile";

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: const Text("Agile"),
          centerTitle: true,
        ),
        body: buildBody(context));
  }

  Widget buildBody(
      BuildContext context) {
    return const Center(child: Text("we will build this part later.."));
  }

}
