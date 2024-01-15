import 'package:fikra/home.dart';
import 'package:fikra/pages/Favorites.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

import 'Confirmation.dart';

void main() {
  runApp(SeatReservationApp());
}

class SeatReservationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seat Reservation',
      home: SeatReservationPage(),
    );
  }
}

class SeatReservationPage extends StatefulWidget {
  @override
  _SeatReservationPageState createState() => _SeatReservationPageState();
}

class _SeatReservationPageState extends State<SeatReservationPage> {
  int numberOfSeats = 0;
  DateTime selectedDate = DateTime.now();
  String selectedTime = '';

  bool isButtonSelected(String time) {
    return selectedTime == time;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: (){
          },
          child: IconButton(
            icon: Icon(Icons.arrow_back) ,
            color: Colors.black54,
            iconSize: 30, onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
          },
          ),),
        title: Text(
          'Seat Reservation',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Number of Seats',
                      style: TextStyle(fontSize: 17),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (numberOfSeats > 0) {
                                numberOfSeats--;
                              }
                            });
                          },
                          child: Icon(
                            Icons.arrow_drop_down,
                            size: 26,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          numberOfSeats.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (numberOfSeats < 10) {
                                numberOfSeats++;
                              }
                            });
                          },
                          child: Icon(
                            Icons.arrow_drop_up,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                padding: const EdgeInsets.all(16.0),
                child: TableCalendar(
                  firstDay: DateTime.now(),
                  lastDay: DateTime.now().add(Duration(days: 365)),
                  focusedDay: selectedDate,
                  selectedDayPredicate: (day) {
                    return isSameDay(selectedDate, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      selectedDate = selectedDay;
                    });
                  },
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                  ),
                  calendarStyle: CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: Colors.lightGreen,
                      shape: BoxShape.circle,
                    ),
                    selectedTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    defaultTextStyle: TextStyle(color: Colors.black),
                    weekendTextStyle: TextStyle(color: Colors.black),
                    // Other customizations...
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select Timing',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 5),
                    Wrap(
                      spacing: 13,
                      children: [
                        '18:00',
                        '19:00',
                        '19:30',
                        '20:30',
                        '21:00',
                        '21:30',
                        '22:00',
                        '22:30',
                      ].map((time) {
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: isButtonSelected(time)
                                ? Colors.lightGreen : null,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selectedTime = time;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              primary: Colors.transparent,
                              elevation: 0,
                              padding: EdgeInsets.zero,
                            ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              child: Text(
                                time,
                                style: TextStyle(
                                  color: isButtonSelected(time)
                                      ? Colors.black
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Confirmation()));
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 130, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  primary: Colors.green[900],
                ),
                child: Text(
                  'Reserve Now',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white, // Set text color to white
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}