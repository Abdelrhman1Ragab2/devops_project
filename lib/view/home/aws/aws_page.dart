import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/api-provider.dart';
import '../../../core/widget/add-user-dialog.dart';
import '../../../model/user.dart';

class AWS extends StatefulWidget {
  const AWS({Key? key}) : super(key: key);
  static const routeName = "AWS";

  @override
  State<AWS> createState() => _AWSState();
}

class _AWSState extends State<AWS> {
  late List<User> users;

  // @override
  // void initState() {
  //   super.initState();
  //   initializeUsers();
  // }
  // Future<void> initializeUsers() async {
  //   users = await Provider.of<ApiProvider>(context, listen: false).getAllUsers();
  //   await Future.delayed(Duration(seconds: 3));
  //   setState(() {
  //
  //     print("error is :${users.length}");
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("AWS"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AddUserDialog();
                      });
                },
                icon: Icon(
                  Icons.add,
                ))
          ],
        ),
        body: buildBody(context));
  }

  Widget buildBody(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: Provider.of<ApiProvider>(context, listen: false).getAllUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<User> users = snapshot.data!;
          if (users.isEmpty) {
            return const Center(child: Text("no record "));
          }
          return allUserList(
              users); // Assuming allUserList is a widget that renders the user list
        } else if (snapshot.hasError) {
          return const Center(child: Text("Error"));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget allUserList(List<User> users) {
    return ListView.separated(
        itemBuilder: (context, index) => userItem(users[index]),
        separatorBuilder: (context, index) => SizedBox(
              height: 15,
            ),
        itemCount: users.length);
  }

  Widget userItem(User user) {
    return Row(
      children: [
        Text(user.userId ?? "id"),
        Text(user.userName ?? "name"),
        Text(user.userEmail ?? "email"),
        Text(user.userPhone ?? "phone")
      ],
    );
  }
}
