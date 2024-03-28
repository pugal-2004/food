import 'package:flutter/material.dart';
import 'package:food/components/current_location.dart';
import 'package:food/components/description.dart';
import 'package:food/components/drawer.dart';
import 'package:food/components/my_origami_tile.dart';
import 'package:food/components/my_tab.dart';
import 'package:food/components/silver_app_bar.dart';
import 'package:food/models/food.dart';
import 'package:food/models/shop.dart';
import 'package:food/pages/org_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>with SingleTickerProviderStateMixin {

//tab controller
late TabController _tabController;

@override
void initState(){
  super.initState();
  _tabController = TabController(
    length: OrigamiCategory.values.length, vsync: this);
}

@override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  List <origami> _filterOrigamiByCategory(OrigamiCategory category, List <origami>fullMenu){
    return fullMenu.where((origami) => origami.category== category).toList();
  }
  //return list of food in give in category
  List <Widget> getOrigamiInThisCategory(List<origami>fullMenu){
    return OrigamiCategory.values.map((Category) {

      // get category origami 
      List<origami> categoryMenu= _filterOrigamiByCategory(Category, fullMenu);
      return ListView.builder(
        itemCount:categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding:  EdgeInsets.zero,
        itemBuilder: (context, index) {
          //get individual 
          final origami = categoryMenu[index];

          //return orgTile
          return OrgTile(Origami: origami, onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> OrgPage(Origami: origami))));
        },
        );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
     drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context,
         innerBoxIsScrolled) => [
          MySilverAppBar(
            title: MyTabBar(tabController: _tabController),
            child:Column(
             mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Divider(indent: 25,
              endIndent: 25,
              color: Theme.of(context).colorScheme.secondary,
              ),
                  //my current location
                    const MyCurrentLocation(),

                  //description box
                 const  MyDescription(),
          ],),
          ),
         ],
         body:Consumer<Shop>(
          builder: (context, Shop,child)=>TabBarView(
            controller: _tabController,
            children: getOrigamiInThisCategory(Shop.menu),
            ),
          ),
      ),
    );
  }
}