
import 'package:flutter/material.dart';
import 'package:seller/pages/login.dart';
//import 'pages/home.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.greenAccent,
    ),
    home: Login(),
  ));
}

