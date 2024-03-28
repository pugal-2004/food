import 'package:food/models/food.dart';

class CartItem{
  origami Origami;
  List<Addon> selectedAddons;
  int quantity;
  CartItem({
  required this.Origami,
  required this.selectedAddons,
   this.quantity=1,
  });

double get totalPirce{
  double addonsPrice = selectedAddons.fold(0,(sum,addon) => sum + addon.price);
  return(Origami.price + addonsPrice )* quantity;
}

}