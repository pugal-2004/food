import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings",
        style: TextStyle(fontWeight: FontWeight.bold,
        fontSize: 20
        ),
        ),
        centerTitle: true,
      ),
    );
  }
}