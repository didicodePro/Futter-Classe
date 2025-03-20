//  PROGRAMMEUR : Dylane

import 'package:flutter/material.dart';
import '../screens/home_screen.dart';

void main() {
  runApp(AppGarageSale());
}

class AppGarageSale extends StatelessWidget {
  
  const AppGarageSale({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}




