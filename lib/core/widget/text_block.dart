import 'package:flutter/material.dart';

class TextBlock extends StatelessWidget {
  final String title;
  final String description;
  const TextBlock( {Key? key,required this.title,required this.description,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title,style: TextStyle(color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w700,
            fontSize:30
          ),

          ),
        ),
        const SizedBox(height: 15,),
        Container(
          color: Colors.grey.shade300,
            padding: const EdgeInsets.all(16),
            child: Text(description,style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize:20
            ),))

      ],
    );
  }
}
