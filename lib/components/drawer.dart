

import 'package:flutter/material.dart';
import 'package:food/components/My_Drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key); // Corrected constructor

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: Icon(
              Icons.lock_open_outlined,
              size: 80,
              color: Colors.lime,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(25),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          //home list tile
          MyDrawerTile(
            icon: Icons.home,
            text: "H O M E",
            onTap: (){print("home tapped")},
          ),
          //settings list tile
          //logout list tile
        ],
      ),
    );
  }
}