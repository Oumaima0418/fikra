import 'package:fikra/home.dart';
import 'package:fikra/main.dart';
import 'package:fikra/pages/Results.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(const Search());
}

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatelessWidget {
  var height, width;
  List icons = [
    Icons.breakfast_dining,
    Icons.lunch_dining,
    Icons.restaurant,
    Icons.coffee,
    Icons.local_pizza,
    Icons.tv,
  ];
  List Title = [
    "Breakfast Options",
    "Lunch Options",
    "Dinner Options",
    "Coffee Options",
    "Street Food ",
    "Events",
  ];

  @override
  Widget build(BuildContext context) {
    height= MediaQuery.of(context).size.height;
    width= MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.green[300],
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(),
              height: height * 0.25,
              width: width,
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 15,
                    left: 15,
                    right: 15,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){

                          },
                        child: IconButton(
                          icon: Icon(Icons.arrow_back) ,
                          color: Colors.white,
                          iconSize: 30, onPressed: () { Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        ); },
                        ),),],),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 15,
                    left: 15,
                    right: 15,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                        prefixIconColor: Colors.white,
                        suffixIconColor: Colors.white,

                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(width: 0.8, color: Colors.white,),

                        ),
                        hintText: 'Search Seat,Food or restaurants',
                        prefixIcon: IconButton(
                            icon:Icon(Icons.search),
                            iconSize: 30,
                          onPressed: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ResultsPage()),
                          ); },

                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {

                          },
                        )
                    ),
                  ),
                ),

              ],),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )
              ),
              height: height * 0.75,
              width: width,
              padding: EdgeInsets.symmetric(vertical:30 ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                  mainAxisSpacing: 20,

                ),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index){
                  return InkWell(
                    onTap:(){} ,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green[300],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              spreadRadius: 1,
                              blurRadius: 6,
                            )
                          ]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 80,
                            height: 80,

                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 1,
                                    blurRadius: 6,
                                  )
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),

                                border: Border.all(
                                  color: Colors.white,

                                )
                            ),

                            child: Icon(
                              icons[index],
                              size: 60,
                              color: Colors.green[900],


                            ),
                          ),
                          Text(
                            Title[index],
                            style:TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Colors.green.shade900,

                            ) ,
                          )
                        ],
                      ),

                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),

    );
  }
}