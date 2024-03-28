import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food/models/cart_item.dart';
import 'package:food/models/food.dart';

class Shop extends ChangeNotifier{
  //list of origami
  final List<origami> _menu = [
//kirigami

origami(
  name: "kirigami", 
description: "handMade by staffs",
 imagepath: '',
  price: 200,
   category: OrigamiCategory.kirigami,
    availableAddons: [
      Addon(name: "special order", price: 300)
    ],
    ),
    origami(
  name: "kirigami 2.o", 
description: "handMade by village",
 imagepath: '',
  price: 200,
   category: OrigamiCategory.kirigami,
    availableAddons: [
      Addon(name: "special order", price: 300)
    ],
    ),
    origami(
  name: "kirigami 3.o", 
description: "Made by ownerwife",
 imagepath: '',
  price: 200,
   category: OrigamiCategory.kirigami,
    availableAddons: [
      Addon(name: "special order", price: 300)
    ],
    ),
    origami(
  name: "kirigami 4.0", 
description: "handMade by staffs",
 imagepath: '',
  price: 200,
   category: OrigamiCategory.kirigami,
   availableAddons: [
    Addon(name: "nice", price: 700)
   ]
    ),

//strip
origami(
  name: "strip folding ",
 description: "The orgami design is made by the method of striping",
  imagepath: '',
   price: 700,
    category: OrigamiCategory.stripfolding, 
    availableAddons: [
      Addon(name: "made with exta care ", price: 1000)
    ]
    ),
    origami(
      name: "strip folding 2.0 ",
 description: "The orgami design is made by the method of striping",
  imagepath: '',
   price: 900,
    category: OrigamiCategory.stripfolding, 
    availableAddons: [
      Addon(name: "made with exta care ", price: 400)
    ]
    ),
    origami(
      name: "strip folding 3.0",
 description: "The orgami design is made by the method of striping",
  imagepath: '',
   price: 650,
    category: OrigamiCategory.stripfolding, 
    availableAddons: [
      Addon(name: "made with exta care ", price: 10000)
    ]
    ),
    origami(
      name: "strip folding 4.0 ",
 description: "The orgami design is made by the method of striping",
  imagepath: "",
   price: 100,
    category: OrigamiCategory.stripfolding, 
    availableAddons: [
      Addon(name: "made with exta care ", price: 398)
    ]
    ),
//teabagfold
origami(
  name: "teabagfolding",
 description: "inspired from tea bag craft", 
 imagepath: '', 
  price: 900,
   category: OrigamiCategory.teabagfolding,
    availableAddons: [
      Addon(name: "made by best worker", price: 750)
    ],
    ),
origami(
      name: "teabagfolding 2.0",
 description: "inspired from tea bag craft", 
 imagepath: '',
  price: 49,
   category: OrigamiCategory.teabagfolding,
    availableAddons: [
      Addon(name: "made by best worker", price: 200)
    ],
    ),
origami(
      name: "teabagfolding 3.0",
 description: "inspired from tea bag craft", 
 imagepath: '',
  price: 4000,
   category: OrigamiCategory.teabagfolding,
    availableAddons: [
      Addon(name: "made by best worker", price: 7500)
    ],
    ),
origami(
        name: "teabagfolding 4.0",
 description: "inspired from tea bag craft", 
 imagepath:'',
  price: 40000,
   category: OrigamiCategory.teabagfolding,
    availableAddons: [
      Addon(name: "made by best worker", price: 780000)
    ],
    ),


//tessellation

    origami(
  name: "origami tesselation 2.o",
 description: "lalala", 
 imagepath: 'lib/images/tessellation/img1.jpg',
  price: 30987,
   category: OrigamiCategory.tessellations,
    availableAddons: [
      Addon(name: "slight costly", price: 80000)
    ]
    ),
    origami(
  name: "origami tesselation 3.0",
 description: "oragami tessellation is an old process of making origami", 
 imagepath: 'lib/images/tessellation/img2.jpg',
  price: 789000,
   category: OrigamiCategory.tessellations,
    availableAddons: [
      Addon(name: "slight costly", price: 89667)
    ]
    ),
    origami(
  name: "origami tesselation 4.0",
 description: "oragami tessellation is an old process of making origami", 
 imagepath: 'lib/images/tessellation/img3.jpg',
  price: 90000,
   category: OrigamiCategory.tessellations,
    availableAddons: [
      Addon(name: "slight costly", price: 9800000)
    ]
    ),
     origami(
  name: "origami tesselation 1.0",
 description: "oragami tessellation is an old process of making origami", 
 imagepath: 'lib/images/tessellation/img4.jpg',
  price: 90000,
   category: OrigamiCategory.tessellations,
    availableAddons: [
      Addon(name: "slight costly", price: 9800000)
    ]
    ),
  ];
  //getters

  List <origami> get menu => _menu;
  List<CartItem> get cart => _cart;

  //operations
  
  //User cart
  final List<CartItem> _cart =[];



//add to cart
void addToCart (origami Origami, List <Addon> selectedAddons){
  //see if there is cart item already there or not
  CartItem ? cartItem = _cart.firstWhereOrNull((item) {
    // check the item r same 
    bool isSameOrigami =item.Origami == Origami;

     // check the Addon  r same
     bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);
     return isSameOrigami && isSameAddons;
  });
   //increase the quantity
   if (cartItem != null){
    cartItem.quantity++;
   }
   //otherwise add new item to cart

   else{
    _cart.add(
      CartItem(
        Origami: Origami, 
      selectedAddons: selectedAddons
      ),
    );
   }
   notifyListeners();
}

// remove from cart
void removeFromCart(CartItem cartItem){
  int cartIndex = _cart.indexOf(cartItem);
  
  if(cartIndex != -1){
    if (_cart[cartIndex].quantity>1){
      _cart[cartIndex].quantity--;
    }else{
      _cart.removeAt(cartIndex);
    }
  }
  notifyListeners();

}
//get total price
double getTotalPrice(){
  double total =0.0;
  for (CartItem cartItem in _cart){
    double itemTotal = cartItem.Origami.price;
    for(Addon addon in cartItem.selectedAddons){
      itemTotal += addon.price;
    }
    total += itemTotal * cartItem.quantity;
  }
  return total;
}
//total no of items in cart
int getTotalItemCount(){
  int totalItemCount = 0;
  for(CartItem cartItem in _cart){
    totalItemCount += cartItem.quantity;
  }
  return totalItemCount;
}
//clear cart

void clearCart(){
  _cart.clear();
  notifyListeners();
}


  //helpers
//generate recipt
//format double va;ue into money
//format list of addons
}