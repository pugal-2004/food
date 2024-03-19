import 'package:flutter/material.dart';
import 'package:food/components/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HOME",),
      centerTitle: true,
      ),
      drawer: const MyDrawer(),
    );
  }
}