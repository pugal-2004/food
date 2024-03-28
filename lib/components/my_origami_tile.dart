import 'package:flutter/material.dart';
import 'package:food/models/food.dart';

class OrgTile extends StatelessWidget {

final origami Origami;
final Function()? onTap;

  const OrgTile({
    super.key,
    required this.Origami,
    required this.onTap

  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
         GestureDetector(
          onTap: onTap,
          
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(children: [
              //food dteail
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Origami.name),
                  Text(Origami.price.toString(),
                  style:const  TextStyle(color: Colors.grey),
                  ),
                  Text(Origami.description),
                ],
              ),
              ),
               const SizedBox(width: 15,),
              //food Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(Origami.imagepath, height: 120,),
                ),
            ],
            ),
          ),
         ),
         //divider
         const Divider(color: Colors.grey,
         endIndent: 25,
         indent: 25,
         )
      ],
    );
  }
}