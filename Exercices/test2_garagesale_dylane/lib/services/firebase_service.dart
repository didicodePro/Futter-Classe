import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/garagesale.dart';

class FirebaseService {
  final CollectionReference garageSaleCollection =
      FirebaseFirestore.instance.collection('garage_sales');

  // ✅ Obtenir les ventes de garage en temps réel
  Stream<QuerySnapshot> getGarageSalesStream() {
    return garageSaleCollection.snapshots();
  }

  // ✅ Mettre à jour le favori
  Future<void> toggleFavorite(String id, bool isFavorite) async {
    await garageSaleCollection.doc(id).update({
      'isFavorite': !isFavorite,
    });
  }

  // ✅ Ajouter une vente dans Firestore
  Future<void> addGarageSale(GarageSale newSale) async {
    await garageSaleCollection.add({
      'address': newSale.address,
      'city': newSale.city,
      'date': newSale.date,
      'startTime': newSale.startTime,
      'endTime': newSale.endTime,
      'category': newSale.notes,
      'imagePath': newSale.imagePath,
      'isFavorite': newSale.isFavorite,
    });
  }
}
