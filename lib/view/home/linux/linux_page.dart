
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:network/model/connection.dart';
import 'package:provider/provider.dart';

import '../../../controller/connectionProvider.dart';


class Linux extends StatefulWidget {
  const Linux({Key? key}) : super(key: key);
  static const routeName = "Linux";

  @override
  State<Linux> createState() => _LinuxState();
}

class _LinuxState extends State<Linux> {
List<Connection>connections=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text("Linux"),
          actions: [IconButton(onPressed: ()async{
            try {
              final file = File('protocolPortInfo.txt');
              String fileContent = await file.readAsString();
              print(fileContent);
            } catch (e) {
              print('Error reading file: $e');
            }

            List<Connection> list =await Provider.of<ConnectionProvider>(context,listen: false).readFile() ;

            setState(() {
              connections=list;
            });
          }, icon: Icon(Icons.refresh))],
          centerTitle: true,
        ),
        body: buildBody(context));
  }

  Widget buildBody(
      BuildContext context) {

    return ListView.separated(itemBuilder: (context,index)=>display(connections[index]),
        separatorBuilder: (context,index)=>const SizedBox(height: 50,), itemCount: connections.length);
  }

  Widget display(Connection connection){
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey,
      child: Row(
        children: [
          Text(connection.connectionType),
          const SizedBox(width: 100,),
          Text(connection.connectionPort)

        ],
      ),
    );

  }
}
