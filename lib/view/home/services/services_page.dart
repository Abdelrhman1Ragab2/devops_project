import 'package:flutter/material.dart';


class Services extends StatelessWidget {
  const Services({Key? key}) : super(key: key);
  static const routeName = "DayLabels";

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: const Text("waiting..."),
          centerTitle: true,
        ),
        body: buildBody(context));
  }

  Widget buildBody(
      BuildContext context) {
    return const Center(child: Text("we will build this part later.."));
  }

}
