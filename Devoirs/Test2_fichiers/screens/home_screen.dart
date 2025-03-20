//  TEST 2 
//  PROGRAMMEUR : VOTRE NOM

import 'package:flutter/material.dart';
import 'list_garagesale.dart';
import 'add_garagesale.dart';
import 'favorite_garagesales.dart';
import '../models/garagesale.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

 final List<GarageSale> tabListYardSale = List.from(tabGarageSale);

  final List<Widget> _tabs = [];

  @override
  void initState() {
    super.initState();
    _tabs.addAll([
      ListGaragesale(),
      FavoriteYardSales(),
    ]);
  }

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToAddSaleScreen(BuildContext context) async {
    /*final newGarageSale = await*/ Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddGarageSale()),
    );
    /*if (newGarageSale != null) {
      setState(() {
        tabListYardSale.add(newGarageSale);
      });
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Garage Sales'),
      ),
      body: _tabs[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddSaleScreen(context),
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTabSelected,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Garage Sales'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites To Visit'),
        ],
      ),
    );
  }
}
