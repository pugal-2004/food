import 'package:flutter/material.dart';
import 'package:food/models/shop.dart';
import 'package:provider/provider.dart';

class MyCartTile extends StatelessWidget {
  const MyCartTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(builder: (context, Shop, child) =>
     Container(
      child:  Column(
        children: [
          Row(
            children: [
               //org image
               Image.asset(''),

          //name and price

          //increament or decreament
            ],
          )
        ],
      ),

    ) ,
    );
  }
}