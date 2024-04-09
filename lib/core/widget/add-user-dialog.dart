import 'package:flutter/material.dart';
import 'package:network/model/user.dart';
import 'package:provider/provider.dart';

import '../../controller/api-provider.dart';


class AddUserDialog extends StatefulWidget {

  const AddUserDialog({Key? key})
      : super(key: key);

  @override
  State<AddUserDialog> createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {


  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     if (widget.forEditing ) {
  //       doInitOperation(context);
  //     }
  //   });
  //
  // }
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  Widget buildBody(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 150, right: 150, top: 50, bottom: 50),
      child: AlertDialog(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 20,
          title: const Text( "Add user",style: TextStyle(color: Colors.white),),
          content: contentBody(context),
          actionsAlignment: MainAxisAlignment.center,
          actions: actionBody(context)),
    );
  }

  List<Widget> actionBody(BuildContext context) {
    return [
      MaterialButton(
        padding: const EdgeInsets.all(12.0),
        elevation: 20,
        color: const Color.fromRGBO(204, 10, 10, 0.9019607843137255),
        onPressed: () async {
          Provider.of<ApiProvider>(context,listen: false).addUser(User(userId: DateTime.now().toString(),
              userName: Provider.of<ApiProvider>(context,listen: false).nameController.text,
              userEmail: Provider.of<ApiProvider>(context, listen: false).emailController.text,
              userPhone: Provider.of<ApiProvider>(context,listen: false).phoneController.text));

          Navigator.pop(context);

        },

        child: Text(
          "save",
        ),
      ),
      const SizedBox(
        width: 15,
      ),
      MaterialButton(
        padding: const EdgeInsets.all(12.0),
        elevation: 20,
        color: const Color.fromRGBO(224, 224, 224, 0.9019607843137255),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Text(
          "Discard",
        ),
      ),
    ];
  }

  Widget contentBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          titleFieldBody(context),
          const SizedBox(
            height: 10,
          ),
          nameFieldBody(context),
          const SizedBox(
            height: 10,
          ),
          phoneFieldBody(context),


        ],
      ),
    );
  }

  Widget titleFieldBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextFormField(
          style: const TextStyle(color: Colors.white),
          controller: Provider.of<ApiProvider>(context).emailController,
          decoration: const InputDecoration(
            hintStyle: TextStyle(color: Colors.white),
            hintText: "email",
          )),
    );
  }

  Widget nameFieldBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextFormField(
          style: const TextStyle(color: Colors.white),
          controller: Provider.of<ApiProvider>(context).nameController,
          decoration: const InputDecoration(
            hintStyle: TextStyle(color: Colors.white),
            hintText: "name",
          )),
    );
  }


  Widget phoneFieldBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextFormField(
          style: const TextStyle(color: Colors.white),
          controller: Provider.of<ApiProvider>(context).phoneController,
          decoration: const InputDecoration(
            hintStyle: TextStyle(color: Colors.white),
            hintText: "phone",
          )),
    );
  }



  // Future<void> onSave(BuildContext context) async {
  //   if (widget.forEditing) {
  //     Provider.of<TaskProvider>(context, listen: false).updateTask(widget.task!.id);
  //   } else {
  //     await Provider.of<TaskProvider>(context, listen: false).crateTask();
  //   }
  // }

  // doInitOperation(BuildContext context) async{
  //   await Provider.of<TaskProvider>(context, listen: false).doEditingOperation(
  //     name: widget.task!.name,
  //     description: widget.task!.description,
  //     status: widget.task!.status,
  //     category: widget.task!.category,
  //     myStartDate: widget.task!.startDate,
  //     myEndDate: widget.task!.endDate,
  //   );
  // }
}
