import 'package:flutter/material.dart';

class GroupMembersPage extends StatefulWidget {

   const GroupMembersPage({super.key});

  @override
  State<GroupMembersPage> createState() => _GroupMembersPageState();
}

class _GroupMembersPageState extends State<GroupMembersPage> {
  final List<GroupMember> members = [
    GroupMember(
      name: 'Sami Abdelaziz',
      imageUrl: 'assets/images/sami.jpg',
      linkedinUrl: 'https://www.linkedin.com/in/johndoe',
    ),
    GroupMember(
      name: 'Abdelrhman Ragab',
      imageUrl: 'assets/images/me.jpg',
      linkedinUrl: 'https://www.linkedin.com/in/johndoe',
    ),
    GroupMember(
      name: 'Ali Refaay',
      imageUrl: 'assets/images/refaay.jpg',
      linkedinUrl: 'https://www.linkedin.com/in/johndoe',
    ),
    GroupMember(
      name: 'Ahmed Abdelnaser',
      imageUrl: 'assets/images/ahmed.jpg',
      linkedinUrl: 'https://www.linkedin.com/in/johndoe',
    ),
    GroupMember(
      name: 'John Doe',
      imageUrl: 'assets/images/sami.jpg',
      linkedinUrl: 'https://www.linkedin.com/in/johndoe',
    ),
    GroupMember(
      name: 'John Doe',
      imageUrl: 'assets/images/sami.jpg',
      linkedinUrl: 'https://www.linkedin.com/in/johndoe',
    ),
    GroupMember(
      name: 'John Doe',
      imageUrl: 'assets/images/sami.jpg',
      linkedinUrl: 'https://www.linkedin.com/in/johndoe',
    ),
    GroupMember(
      name: 'John Doe',
      imageUrl: 'assets/images/sami.jpg',
      linkedinUrl: 'https://www.linkedin.com/in/johndoe',
    ),
    GroupMember(
      name: 'John Doe',
      imageUrl: 'assets/images/sami.jpg',
      linkedinUrl: 'https://www.linkedin.com/in/johndoe',
    ),
    GroupMember(
      name: 'John Doe',
      imageUrl: 'assets/images/sami.jpg',
      linkedinUrl: 'https://www.linkedin.com/in/johndoe',
    ),
    GroupMember(
      name: 'John Doe',
      imageUrl: 'assets/images/sami.jpg',
      linkedinUrl: 'https://www.linkedin.com/in/johndoe',
    ),
    GroupMember(
      name: 'John Doe',
      imageUrl: 'assets/images/sami.jpg',
      linkedinUrl: 'https://www.linkedin.com/in/johndoe',
    ),
    GroupMember(
      name: 'John Doe',
      imageUrl: 'assets/images/sami.jpg',
      linkedinUrl: 'https://www.linkedin.com/in/johndoe',
    ),
    GroupMember(
      name: 'John Doe',
      imageUrl: 'assets/images/sami.jpg',
      linkedinUrl: 'https://www.linkedin.com/in/johndoe',
    ),
    GroupMember(
      name: 'John Doe',
      imageUrl: 'assets/images/sami.jpg',
      linkedinUrl: 'https://www.linkedin.com/in/johndoe',
    ),
    // Add more members here
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
    //  height: 1800,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: members.length,
          itemBuilder: (context, index) {
            final member = members[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _launchUrl(member.linkedinUrl);
                  },
                  child: CircleAvatar(
                    radius: 100.0,
                    backgroundImage: AssetImage(member.imageUrl),


                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  member.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                  ),
                ),
                // const SizedBox(height: 4.0),
                // GestureDetector(
                //   onTap: () {
                //     _launchUrl(member.linkedinUrl);
                //   },
                //   child: Icon(
                //     Icons.home,
                //     color: Colors.blue,
                //   ),
                // ),
              ],
            );
          },
        ),
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
