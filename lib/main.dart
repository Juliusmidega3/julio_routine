import 'package:flutter/material.dart';
import 'package:julio_routine/pages/homepage.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
      theme: ThemeData(primarySwatch: Colors.teal),
    );
  }
}