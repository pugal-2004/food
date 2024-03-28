import 'package:flutter/material.dart';

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context){
  showDialog(context: context,
   builder: (context)=>AlertDialog(
           title: Text("your location"),
           content: TextField(
            decoration: const InputDecoration(hintText: "search Address"),
           ),
           actions: [
            //cancel btn
            MaterialButton(onPressed: ()=>Navigator.pop(context),
            child: const Text("cancel"),
            ),
            //save btn
            MaterialButton(onPressed: ()=>Navigator.pop(context),
            child: const Text("save"),
            ),
           ],

   ),
   );

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text("Delivery now"),
          GestureDetector(
            onTap: () => openLocationSearchBox(context),
            child: Row(
               children: [
                  //address 
                  Text("sankarapurum sithalapakkam",
                  style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  //drop down menu
                  Icon(Icons.keyboard_arrow_down_rounded)
                  
              ],
            ),
          ),
        ],
      ),
    );
  }
}