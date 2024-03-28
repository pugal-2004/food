import 'package:flutter/material.dart';

class MyDescription extends StatelessWidget {
  const MyDescription({super.key});

  @override
  Widget build(BuildContext context) {
   

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color:Theme.of(context).colorScheme.secondary),
        borderRadius: BorderRadius.circular(8)
      ),
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(left: 25,right: 25,bottom: 25),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //Delivery time
              Text("0.99"),
             Text("Delivery time",style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),
          //delivery fee
          Column(
            children: [
              Text("0.99"),
             Text("Delivery fee",style: TextStyle(fontWeight: FontWeight.bold),),
            ],
          ),

        ],
      ),
    );
  }
}