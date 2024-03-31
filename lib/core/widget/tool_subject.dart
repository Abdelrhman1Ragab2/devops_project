
import 'package:flutter/material.dart';

class ToolSubject extends StatelessWidget {
  final String title;
  const ToolSubject(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,style: TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 44,
      fontWeight: FontWeight.bold
    ),);
  }
}
