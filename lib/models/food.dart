// ignore: camel_case_types


class origami{
  final String name;
  final String description;
   final  imagepath;
   final double price;
   final OrigamiCategory category ;
   List<Addon> availableAddons;

   origami({
    required this.name,
    required this.description,
    required this.imagepath,
    required this.price,
    required this.category,
    required this.availableAddons
   });
}

//food categories
 enum OrigamiCategory{
  tessellations,
  kirigami,
  stripfolding,
  teabagfolding,


 }

 //asdon
  class Addon{
    String name;
    double price;

    Addon({
       required this.name,
       required this.price

    });
  }