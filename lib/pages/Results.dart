import 'package:flutter/material.dart';

import '../bottomNavBar.dart';
void main() => runApp(const ResultsPage());
class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.black54,),
            onPressed: () {
            Navigator.pop(context); // Handle back button tap
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Available Venues',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Cafes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildVenueList(),
              SizedBox(height: 24),
              Text(
                'Restaurants',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildRestauList(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBarWidget(
          currentIndex: 1,
          onTabTapped: (index) {
            // Handle tab tap here
            print('Tapped on index: $index');
          },
        ),
      ),

    );
  }
  Widget _buildVenueList() {
    return Column(
      children: [
        _buildVenueItem(
          'Cafe 1',
          'cafes/cafe1.jpg',
          '2024-01-13',
          '10:00 AM - 12:00 PM',
          20,
        ),
        SizedBox(height: 16),
        _buildVenueItem(
          'Cafe 2',
          'cafes/cafe1.jpg',
          '2024-01-14',
          '2:00 PM - 4:00 PM',
          10,
        ),
        SizedBox(height: 16),
        _buildVenueItem(
          'Cafe 3',
          'cafes/cafe1.jpg',
          '2024-01-15',
          '5:00 PM - 7:00 PM',
          5,
        ),
      ],
    );
  }
  Widget _buildRestauList() {
    return Column(
      children: [
        _buildVenueItem(
          'Restaurant 1',
          'cafes/cafe1.jpg',
          '2024-01-13',
          '10:00 AM - 12:00 PM',
          20,
        ),
        SizedBox(height: 16),
        _buildVenueItem(
          'Restaurant 2',
          'cafes/cafe1.jpg',
          '2024-01-14',
          '2:00 PM - 4:00 PM',
          10,
        ),
        SizedBox(height: 16),
        _buildVenueItem(
          'Restaurant 3',
          'cafes/cafe1.jpg',
          '2024-01-15',
          '5:00 PM - 7:00 PM',
          5,
        ),
      ],
    );
  }

  Widget _buildVenueItem(
      String name,
      String imagePath,
      String date,
      String hour,
      int availableSeats,
      ) {
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
      child: Padding(
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
            SizedBox(height: 8),
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
      ),
    );
  }
}
