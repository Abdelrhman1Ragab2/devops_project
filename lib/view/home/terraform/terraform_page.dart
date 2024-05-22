import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/api-provider.dart';
import '../../../model/users.dart';

class Terraform extends StatelessWidget {
  const Terraform({Key? key}) : super(key: key);
  static const routeName = "Terraform";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Terraform"),
          centerTitle: true,
        ),
        body: buildBody(context));
  }

  Widget buildBody(
      BuildContext context) {
    return const Center(child: Text("we will build this part later.."));
  }

  // Widget buildBody(BuildContext context) {
  //   return FutureBuilder<List<dynamic>>(
  //     future: Provider.of<ApiProvider>(context, listen: false).fetchUsers(),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasData) {
  //         List<dynamic> users = snapshot.data!;
  //         if (users.isEmpty) {
  //           return const Center(child: Text("no record "));
  //         }
  //         dynamic vistingUsers = users ;
  //         return usersBody( vistingUsers);
  //       } else if (snapshot.hasError) {
  //         return Center(child: Text(snapshot.error.toString()));
  //       } else {
  //         return const Center(child: CircularProgressIndicator());
  //       }
  //     },
  //   );
  // }

  Widget usersBody( List<WebUser> myUsers) {
    return ListView.separated(
        itemBuilder: (context, index) => ListTile(
              title: Text(myUsers[index].name),
              subtitle: Text(myUsers[index].email),
            ),
        separatorBuilder: (context, index) => const SizedBox(
              height: 5,
            ),
        itemCount: myUsers.length);
  }
}
