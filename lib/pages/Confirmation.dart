import 'package:fikra/home.dart';
import 'package:fikra/main.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(Confirmation());
}
class Confirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded,color: Colors.black,),
            onPressed: (){
                Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle,
                size: 100,
                color: Colors.green,
              ),
              SizedBox(height: 20),
              Text(
                'Reservation Successful !',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),

        ),
        floatingActionButton: Container(

          width: 300,
          height: 50,

          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.green,
              width: 1,
            ),
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) => Home()));
            },
            child: Text('Find a Seat'),
            style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),

    );



  }

}

