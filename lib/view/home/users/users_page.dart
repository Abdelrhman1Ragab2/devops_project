import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/api-provider.dart';
import '../../../model/users.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);
  static const routeName = "UsersPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Users"),
          centerTitle: true,
        ),
        body: buildBody(context));
  }


  Widget buildBody(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: Provider.of<ApiProvider>(context, listen: false).fetchUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<dynamic> users = snapshot.data!;
          if (users.isEmpty) {
            return const Center(child: Text("no record "));
          }
          dynamic vistingUsers = users ;
          return usersBody( vistingUsers);
        } else if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget usersBody( List<WebUser> myUsers) {
    return ListView.separated(
        itemBuilder: (context, index) => userItem(myUsers[index]),
        separatorBuilder: (context, index) => const SizedBox(
              height: 5,
            ),
        itemCount: myUsers.length);
  }

  Widget userItem(WebUser user) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.grey.shade400,
      child: Row(
        children: [
          Expanded(flex:2,child: awsText(user.name )),
          Expanded(flex:2,child: awsText(user.email )),
        ],
      ),
    );
  }
  Widget awsText(String info){
    return Text(info,
      style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700
      ),
    );
  }

}
