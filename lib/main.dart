import 'package:flutter/material.dart';
import 'package:zarurat/Home/home.dart';

void main() {
  runApp(Zarurat());
}

class Zarurat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}