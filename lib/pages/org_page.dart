import 'package:flutter/material.dart';
import 'package:food/components/my_button.dart';
import 'package:food/models/food.dart';


class OrgPage extends StatefulWidget {
final origami Origami;
final Map<Addon,bool> selectedAddon={};

   OrgPage({super.key,
  required this.Origami,
  }){
    //initialize the selected Addon
    for (Addon addon in  Origami.availableAddons){
      selectedAddon[addon]= false;
    }
  }

  @override
  State<OrgPage> createState() => _OrgPageState();
}

class _OrgPageState extends State<OrgPage> {
 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //food image
            Image.asset(widget.Origami.imagepath),
            
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              //org name
              Text(widget.Origami.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              ),
              //org price
               Text (widget.Origami.price.toString(),
               style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.grey,
              ),
              ),
              const SizedBox(height: 10,),
        
              const Divider( color: Colors.grey,),
              //addon text
              const Text("Add-On",
               
               style:  TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.grey,
              ),
        
              ),
              //org description
              Text (widget.Origami.description),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black
                  ),
                  borderRadius: BorderRadius.circular(8),
                  ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: widget.Origami.availableAddons.length,
                  itemBuilder: (context, index) {
                    //get individual
                    Addon addon = widget.Origami.availableAddons[index];
                          
                    return CheckboxListTile(
                      title: Text(addon.name),
                      subtitle: Text(addon.price.toString()),
                      value: widget.selectedAddon[addon],
                     onChanged: (bool?value){
                      setState(() {
                        widget.selectedAddon[addon]= value!;

                      });
                     },
                     );
                  },
                ),
              ),
            ],),
          ),
            //buttons to add cart
            MyButton(onTap: (){}, 
            text: "Add to cart"),
             const SizedBox(height: 25,)
          ],
        ),
      ),
    );
  }
}