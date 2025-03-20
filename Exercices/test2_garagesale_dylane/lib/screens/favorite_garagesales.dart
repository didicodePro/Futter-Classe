import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firebase_service.dart';

class FavoriteYardSales extends StatelessWidget {
  final FirebaseService _firebaseService = FirebaseService();

  FavoriteYardSales({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firebaseService.getGarageSalesStream(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text("Aucune vente favorite."));
        }

        // Filtrer uniquement les favoris
        final favoriteSales = snapshot.data!.docs
            .where((sale) => sale['isFavorite'] == true)
            .toList();

        if (favoriteSales.isEmpty) {
          return Center(child: Text("Aucune vente de garage en favori."));
        }

        return ListView.builder(
          itemCount: favoriteSales.length,
          itemBuilder: (context, index) {
            final sale = favoriteSales[index];
            final String imageUrl = sale['imagePath'] ?? '';

            return Card(
              elevation: 5,
              margin: EdgeInsets.all(8),
              child: ListTile(
                leading: imageUrl.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          imageUrl,
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.image_not_supported, size: 50, color: Colors.grey);
                          },
                        ),
                      )
                    : Icon(Icons.image, size: 50, color: Colors.grey),
                title: Text(
                  "${sale['address']} | ${sale['city']}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${sale['date']} | ${sale['startTime']} - ${sale['endTime']}"),
                    Text("Catégorie: ${sale['category']}", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.favorite, color: Colors.red),
                  onPressed: () {
                    _firebaseService.toggleFavorite(sale.id, true);
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
