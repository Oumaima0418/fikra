import 'package:fikra/home.dart';
import 'package:fikra/pages/Favorites.dart';
import 'package:fikra/pages/Profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'bottomNavBar.dart';
import 'home/main_food_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        debugShowCheckedModeBanner: false,
      home: Home()
    );
  }
}

