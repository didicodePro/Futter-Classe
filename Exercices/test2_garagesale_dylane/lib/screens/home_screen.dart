import 'package:flutter/material.dart';
import 'package:test2_garagesale_dylane/main.dart';
import 'list_garagesale.dart';
import 'favorite_garagesales.dart';
import 'add_garagesale.dart';
import '../models/garagesale.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<GarageSale> _garageSales = List.from(tabGarageSale);

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToAddSaleScreen(BuildContext context) async {
    final newGarageSale = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddGarageSale()),
    );

    if (newGarageSale != null && newGarageSale is GarageSale) {
      setState(() {
        _garageSales.add(newGarageSale); // ✅ Ajoute la vente à la liste
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Garage Sales',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          GlobalLogoutButton(),
        ],
        centerTitle: true,
        backgroundColor: Colors.teal[800],
      ),
      body: _selectedIndex == 0
          ? ListGaragesale()
          : FavoriteYardSales(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddSaleScreen(context),
        child: Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Garage Sales',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: _selectedIndex == 1 ? Colors.red : null),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
