import 'package:flutter/material.dart';
import 'package:food/components/my_cart_tile.dart';
import 'package:food/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(builder:(context, Shop, child) {
      //cart

      final userCart = Shop.cart;

      //Sacffold UI
       return Scaffold(
        appBar: AppBar( title: const Text("Cart"),
        backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: userCart.length,
              itemBuilder: (context , index ){
                //individual cart item
                final cartItem = userCart[index];
                return MyCartTile(
                
                );
              }
              ),
              ),
          ],
        ),
        
        
       );


    });
  }
}