//  TEST 2 
//  PROGRAMMEUR : VOTRE NOM

import 'package:flutter/material.dart'; 
import '../models/garagesale.dart';

class ListGaragesale extends StatefulWidget {
  const ListGaragesale({super.key});

  @override
  ListGarageSaleState createState() => ListGarageSaleState();
}

class ListGarageSaleState extends State<ListGaragesale> {
  void toggleFavorite(int index) {
    setState(() {
      tabGarageSale[index].isFavorite = !tabGarageSale[index].isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tabGarageSale.length,
      itemBuilder: (context, index) {
        final garagesale = tabGarageSale[index];
        return Card(
          child: ListTile(
            title: Text("${garagesale.address} | ${garagesale.city}"),
            subtitle: Text("${garagesale.date} | ${garagesale.startTime} - ${garagesale.endTime}"),
            trailing: IconButton(
              icon: Icon(
                garagesale.isFavorite ? Icons.favorite : Icons.favorite_border,
                color: garagesale.isFavorite ? Colors.red : null,
              ),
              onPressed: () => toggleFavorite(index),
            ),
          ),
        );
      },
    );
  }
}
