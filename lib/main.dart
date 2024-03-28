import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food/auth/auth_gate.dart';
import 'package:food/firebase_options.dart';
import 'package:food/models/shop.dart';
import 'package:provider/provider.dart';


void main()async{
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
runApp(
   MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=> Shop()),
   ],
   child:const  MyApp(),
   ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:   AuthGate(),
        
      );
  }
}
