import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firebase_service.dart';

class ListGaragesale extends StatelessWidget {
  final FirebaseService _firebaseService = FirebaseService();

  ListGaragesale({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firebaseService.getGarageSalesStream(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text("Aucune vente de garage ajoutée."));
        }

        final garageSales = snapshot.data!.docs;

        return ListView.builder(
          itemCount: garageSales.length,
          itemBuilder: (context, index) {
            final sale = garageSales[index];
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
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.image_not_supported, size: 50, color: Colors.red);
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
                  icon: Icon(
                    sale['isFavorite'] == true ? Icons.favorite : Icons.favorite_border,
                    color: sale['isFavorite'] == true ? Colors.red : null,
                  ),
                  onPressed: () {
                    _firebaseService.toggleFavorite(sale.id, sale['isFavorite']);
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
