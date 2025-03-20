//  TEST 2 
//  PROGRAMMEUR : VOTRE NOM

class GarageSale {
  final String id;
  final String address;
  final String city;
  final String date;
  final String startTime;
  final String endTime;
  final String notes;
  bool isFavorite;

  GarageSale({
    required this.id,
    required this.address,
    required this.city,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.notes,
    this.isFavorite = false,
  });
}


List <GarageSale> tabGarageSale = [
  GarageSale(
    id: 'y1',
    address: '333 rue Bellefleur ',
    city: 'Beresford',
    date: '12/04/2025',
    startTime: '09:00',
    endTime: '12:00',
    notes: 'articles bebe',
    isFavorite: false,

  ),
  GarageSale(
    id: 'y2',
    address: '444 College Ave',
    city: 'Bathurst',
    date: '12/04/2025',
    startTime: '09:00',
    endTime: '12:00',
    notes: 'meubles, electronique',
    isFavorite: true,

  ),
  GarageSale(
    id: 'y3',
    address: '555 chemin Laplante ',
    city: 'Petit-Rocher',
    date: '12/04/2025',
    startTime: '09:00',
    endTime: '12:00',
    notes: 'Outils, electroniques',
    isFavorite: false,

  ),
];
