import 'package:fikra/home.dart';
import 'package:flutter/material.dart';
import '../bottomNavBar.dart';
import 'Profile.dart';

void main() => runApp(const FavoritesPage());

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Saved Locations',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildSavedLocationsList(),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Handle "See More" button tap
                  print('See More tapped');
                },
                child: Text('See More'),
              ),
              SizedBox(height: 48),
              Text(
                'Recently Viewed Locations',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildRecentlyViewedLocationsList(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBarWidget(
          currentIndex: 1,
          onTabTapped: (index) {
            switch (index) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home())
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
        ),
      );
  }

  Widget _buildSavedLocationsList() {
    return Container(
      height: 145,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Row(
              children: [
              SizedBox(width: 16), // Add spacing between containers
          _buildSavedLocationItem('Cafe $index', 'cafes/cafe1.jpg'),
          ]);
        },
      ),
    );
  }

  Widget _buildSavedLocationItem(String locationName, String imagePath) {
    return Padding(
      padding: EdgeInsets.only(right: 16),
      child: Container(
        width: 250,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                width: double.infinity, // Make the image wider
                height: 100, // Adjust the height of the image
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 15),
            Text(
              locationName,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentlyViewedLocationsList() {
    return Column(
      children: [
        _buildVenueList(),
      ],
    );
  }
  Widget _buildVenueList() {
    return Column(
      children: [
        _buildRecentlyViewedLocationItem(
          'Cafe 1',
          'cafes/cafe1.jpg',
          '2024-01-13',
          '10:00 AM - 12:00 PM',
          20,
        ),
        SizedBox(height: 16),
        _buildRecentlyViewedLocationItem(
          'Cafe 2',
          'cafes/cafe1.jpg',
          '2024-01-14',
          '2:00 PM - 4:00 PM',
          10,
        ),
        SizedBox(height: 16),
        _buildRecentlyViewedLocationItem(
          'Cafe 3',
          'cafes/cafe1.jpg',
          '2024-01-15',
          '5:00 PM - 7:00 PM',
          5,
        ),
      ],
    );
  }
  Widget _buildRecentlyViewedLocationItem(String name,
      String imagePath,
      String date,
      String hour,
      int availableSeats,) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes the position of the shadow
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Text(
            name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text('Date: $date'),
          SizedBox(height: 4),
          Text('Hour: $hour'),
          SizedBox(height: 4),
          Text('Available Seats: $availableSeats'),
        ],
      ),
    );
  }
}