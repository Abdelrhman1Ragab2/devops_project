import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/auth_controller.dart';

class TitleItem extends StatefulWidget {
  TitleItem({Key? key}) : super(key: key);

  @override
  State<TitleItem> createState() => _TitleItemState();
}

class _TitleItemState extends State<TitleItem> {
  @override
  Widget build(BuildContext context) {
    return titleBar(context);
  }


  void _onItemTapped(int index) {
    Provider.of<AuthProvider>(context, listen: false).changeMenuIndex(index);
// Implement navigation logic here based on the selected index
  }

  Widget titleBar(BuildContext context) {
    int selectedIndex = Provider.of<AuthProvider>(context, listen: false).itemSelectedIndex;

    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () => _onItemTapped(0),
            child: Text(
              'Home',
              style: TextStyle(
                color: selectedIndex == 0 ? Colors.white : Colors.white54,
                fontWeight:
                    selectedIndex == 0 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          TextButton(
            onPressed: () => _onItemTapped(1),
            child: Text(
              'About',
              style: TextStyle(
                color: selectedIndex == 1 ? Colors.white : Colors.white54,
                fontWeight:
                    selectedIndex == 1 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          TextButton(
            onPressed: () => _onItemTapped(2),
            child: Text(
              'Activities',
              style: TextStyle(
                color: selectedIndex == 2 ? Colors.white : Colors.white54,
                fontWeight:
                    selectedIndex == 2 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          TextButton(
            onPressed: () => _onItemTapped(3),
            child: Text(
              'Register',
              style: TextStyle(
                color: selectedIndex == 3 ? Colors.white : Colors.white54,
                fontWeight:
                    selectedIndex == 3 ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
          SizedBox(
            height: 50,
            width: 100,
            child: Image.asset(
              "assets/images/logo.jpeg",
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
