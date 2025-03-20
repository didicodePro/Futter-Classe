//  TEST 2 
//  PROGRAMMEUR : VOTRE NOM

import 'package:flutter/material.dart'; 
import '../models/garagesale.dart';

class FavoriteYardSales extends StatelessWidget {
  const FavoriteYardSales({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteYardSales = tabGarageSale.where((sale) => sale.isFavorite).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Garage Sales to visit")),
      body: ListView.builder(
        itemCount: favoriteYardSales.length,
        itemBuilder: (context, index) {
          final yardSale = favoriteYardSales[index];
          return Card(
            child: ListTile(
              title: Text("${yardSale.address} | ${yardSale.city}"),
              subtitle: Text("${yardSale.date} | ${yardSale.startTime} - ${yardSale.endTime}"),
            ),
          );
        },
      ),
    );
  }
}
