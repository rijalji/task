import 'package:flutter/material.dart';
import 'package:task/ui/cashpage.dart';
import 'package:task/ui/menupage.dart';
import 'package:task/ui/orderpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Menu(),
    );
  }
}
