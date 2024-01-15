import 'package:fikra/pages/Favorites.dart';
import 'package:fikra/pages/Profile.dart';
import 'package:flutter/material.dart';
import 'bottomNavBar.dart';
import 'home/main_food_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainFoodPage(),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: 0,
        onTabTapped: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Home()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoritesPage()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profile()),
              );
              break;
          }
        },
      ),
    );
  }
}
