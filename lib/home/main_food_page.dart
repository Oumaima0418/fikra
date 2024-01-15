import 'package:fikra/Widgets/small_text.dart';
import 'package:fikra/utils/colors.dart';
import 'package:fikra/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/big_text.dart';
import '../pages/Search.dart';
import 'food_page_body.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.all(Dimensions.width20),
              child: Container(
                margin: EdgeInsets.only(top: 10, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Color(0xffFDCF09),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/batman.jpg'),
                      ),
                    ),
                    Center(
                      child: Container(
                        child: IconButton(
                         icon: Icon(Icons.search_rounded, color: Colors.white),
                          onPressed: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => SearchPage()));
                          },
                        ),
                        width: 45, height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.mainColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: SingleChildScrollView(
            child: FoodPageBody(),
          )),
        ],
      ),
    );
  }
}
