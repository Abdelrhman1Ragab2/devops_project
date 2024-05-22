import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {

  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPagePageState();
}

class _ActivityPagePageState extends State<ActivityPage> {
  final List<String> images =[
    "assets/images/a1.PNG",
    "assets/images/a2.PNG",
    "assets/images/a3.PNG",
    "assets/images/a4.jpeg",
    "assets/images/a5.jpeg",
    "assets/images/a6.jpeg",
    "assets/images/a7.jpeg",
    "assets/images/a7.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 50.0,
          // childAspectRatio: ,
          mainAxisSpacing: 50.0,
        ),
        itemCount: images.length,
        itemBuilder: (context, index) {
          final member = images[index];
          return Container(
        //    color: Colors.black,

            padding: const EdgeInsets.all(16.0),
            child: Image.asset(member,height: 150,width: 150,fit: BoxFit.contain,),
          );
        },
      ),
    );
  }

  void _launchUrl(String url) async {
    //   if (await canLaunch(url)) {
    //     await launch(url);
    //   } else {
    //     throw 'Could not launch $url';
    //   }
  }
}

class GroupMember {
  final String name;
  final String imageUrl;
  final String linkedinUrl;

  GroupMember({
    required this.name,
    required this.imageUrl,
    required this.linkedinUrl,
  });
}
