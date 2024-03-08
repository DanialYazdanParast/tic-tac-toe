import 'package:flutter/material.dart';
import 'package:flutter_tic/screens/home_screen.dart';

void main() {
  runApp( Aplication());
}

class Aplication extends StatelessWidget {
  const Aplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      home: Home(),);
  }
}
