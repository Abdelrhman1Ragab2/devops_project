import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:network/model/connection.dart';

class ConnectionProvider with ChangeNotifier {

  Future<List<Connection>>readFile()async{

      // Path to the file you want to read
      String filePath = 'protocolPortInfo.txt';
      List<Connection> connections =[];

        final file = File(filePath);
        String fileContent = await file.readAsString();

      List<String>lines= await file.readAsLines() ;
      print(lines);
      for(int i=0;i<lines.length;i++){
        List<String>  sp=lines[i].split(',');
        connections.add(
            Connection(sp[0], sp[1]));
      }
      print(connections);
      return connections;
      }

}