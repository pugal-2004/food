import 'package:flutter/material.dart';
import 'package:food/components/my_drawer_tile.dart';
import 'package:food/pages/settings.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        //app logo
        Padding(
          padding:  EdgeInsets.only(top: 100.0),
          child: Icon(Icons.lock_open_outlined,
          size: 80,
          color: Colors.grey,
          ),
        ),
        Padding(
          padding:  EdgeInsets.all(25.0),
          child: Divider(color: Colors.black,),
        ),
        //home tile
        MyDrawerTile(text: "H O M E",
         icon: Icons.home_filled, 
         onTap: () => Navigator.pop(context)),
        //settings tile

        MyDrawerTile(text: "S E T T I N G S",
         icon: Icons.settings, 
         onTap: (){
           Navigator.pop(context);
         Navigator.push(context,
         MaterialPageRoute (
          builder:(context)=>const SettingsPage()));
         }
         ),
         const Spacer(),
        //logout tile
        MyDrawerTile(text: "L O G O U T",
         icon: Icons.logout, 
         onTap: (){}),

      ],),
    );
  }
}