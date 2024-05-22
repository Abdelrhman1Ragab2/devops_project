import 'package:flutter/material.dart';
import 'package:network/controller/auth_controller.dart';
import 'package:network/view/auth/tiltle-bar.dart';
import 'package:provider/provider.dart';

class DashAuth extends StatelessWidget {
  const DashAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }
  Widget buildBody(BuildContext context){
    return SizedBox(
      // height: double.maxFinite,
      // width: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TitleItem(),
            homeBody(context,Provider.of<AuthProvider>(context,listen: false).itemSelectedIndex)
          ],
        ),
      ),
    );
  }

  Widget homeBody(BuildContext context,int index) {
    return SizedBox(child: Provider.of<AuthProvider>(context).screens[index]);
  }
}
