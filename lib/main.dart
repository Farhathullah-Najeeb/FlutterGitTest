// ignore_for_file: prefer_const_constructors, unused_import
import 'package:firbseprovdrtask/edit.dart';
import 'package:firbseprovdrtask/provider.dart';
import 'package:firbseprovdrtask/screens/homescreen.dart';
import 'package:firbseprovdrtask/screens/secondscreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => ProviderClass(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      // routes: {
      //   '/': (context) => HomeScreen(from: '', oldid: '',),
      //   '/2': (context) => SecondScreen(),
      //   // '/3':(context)=>edit(),
      // },
      // initialRoute: '/',
    ),
  ));
}
