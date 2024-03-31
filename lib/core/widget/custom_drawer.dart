import 'package:flutter/material.dart';

import '../../view/menu/menu_ui.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 5,
      width: MediaQuery.of(context).size.width * 1 / 2,
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.9),
      child: const MenuUI()
    );
  }

}
