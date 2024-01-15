import 'package:fikra/main.dart';
import 'package:fikra/pages/Favorites.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../bottomNavBar.dart';
import '../home.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark
  ));
  runApp(const Profile());
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _MyAppState();
}

class _MyAppState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 40,),
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/batman.jpg'),
              ),
              SizedBox(height: 20,),
              itemProfile('Name', 'Ahmed Amine Maarouf', CupertinoIcons.person),
              SizedBox(height: 10,),
              itemProfile('Phone', '0665078802', CupertinoIcons.phone),
              SizedBox(height: 10,),
              itemProfile('Adress', 'abc adress, xyz Agadir', CupertinoIcons.location_solid),
              SizedBox(height: 10,),
              itemProfile('Email', 'ahmedamine.maarouf@e-polytechnique.ma', CupertinoIcons.mail),
              SizedBox(height: 60,),
              ElevatedButton( style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
                  onPressed: (){}, child: Text('Edit Your Profile', style: TextStyle(color: Colors.black),)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: 2,
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

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0,5),
                color: CupertinoColors.systemGreen,
                spreadRadius: 2,
                blurRadius: 10
            )
          ]
      ),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward,color: Colors.grey,),
        tileColor: Colors.white,
      ),
    );
  }
}

