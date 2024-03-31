import 'package:flutter/cupertino.dart';

class ToolLogo extends StatelessWidget {
  final String image;
  const ToolLogo({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Image.asset(image,width: 150,height: 150,),
    );
  }
}
