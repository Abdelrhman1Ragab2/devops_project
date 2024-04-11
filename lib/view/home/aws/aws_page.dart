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
                )),
            IconButton(
                onPressed: () {
                  setState(() {

                  });
                },
                icon: Icon(
                  Icons.refresh,
                )),
          ],
        ),
        body: buildBody(context));
  }

  Widget buildBody(BuildContext context) {
    print("i will build");
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
        itemBuilder: (context, index) => userItem(users[index],index),
        separatorBuilder: (context, index) => SizedBox(
              height: 15,
            ),
        itemCount: users.length);
  }

  Widget userItem(User user,index) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.grey.shade400,
      child: Row(
        children: [
          Expanded(flex:1,child: awsText(index==0?"Id":"${user.userId?.substring(0,5)}******" ?? "id")),
          Expanded(flex:2,child: awsText(user.userName ?? "name")),
          Expanded(flex:2,child: awsText(user.userEmail ?? "email")),
          Expanded(flex:1,child: awsText(user.userPhone ?? "phone")),
          index==0?const Expanded(flex:1,child: SizedBox()):Expanded(flex:1,child: IconButton(onPressed: ()async {
            await Provider.of<ApiProvider>(context,listen: false).deleteUser(user.userId??"id" );
            setState(() {

            });
          },icon:  Icon(Icons.delete,color: Theme.of(context).primaryColor,),))
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
