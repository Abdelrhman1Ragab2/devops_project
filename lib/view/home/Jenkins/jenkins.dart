import 'package:flutter/material.dart';


class Jenkins extends StatelessWidget {
  const Jenkins({Key? key}) : super(key: key);
  static const routeName = "Jenkins";

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: const Text("Jenkins"),
          centerTitle: true,
        ),
        body: buildBody(context));
  }

  Widget buildBody(
      BuildContext context) {
    return const Center(child: Text(" Jenkins"));
  }

}
