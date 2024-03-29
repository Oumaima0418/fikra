import 'package:dots_indicator/dots_indicator.dart';
import 'package:fikra/Widgets/big_text.dart';
import 'package:fikra/Widgets/icon_and_text_widget.dart';
import 'package:fikra/Widgets/small_text.dart';
import 'package:fikra/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/Formulaire.dart';
import '../utils/dimensions.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue=0.0;
  double _scaleFactor=0.8;
  double _height = Dimensions.pageViewContainer;

  @override
  void initState(){
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue=pageController.page!;
      });
    });
  }
  @override
  void dispose(){
    pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
              itemCount: 5,
              itemBuilder: (context, position){
            return _buildPageItem(position);
          }),
        ),
        new DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
          size: const Size.square(9.0),
          activeSize: const Size(18.0, 9.0),
          activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
        ),
        SizedBox(height: Dimensions.height30,),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Popular"),
              SizedBox(width: Dimensions.width10,),
              Container(
                margin : const EdgeInsets.only(bottom: 3),
                child: BigText(text: " . ", color: Colors.black26,),
              ),
              Container(
                child: SmallText(text: "Food pairing"),
              ),
            ],
          ),
        ),
         ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SeatReservationApp()),
                        );
                      },
                      child: Container(
                        width: Dimensions.ListViewImgSize,
                        height: Dimensions.ListViewImgSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: Colors.white38,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/image1.jpg"),
                          ),
                        ),
                      ),
                    ),
                    //text container
                    Expanded(
                      child: Container(
                        height: Dimensions.ListViewTextSize,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius20),
                            bottomRight: Radius.circular(Dimensions.radius20),
                          ),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: Dimensions.width10, right: Dimensions.width10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BigText(text: "La Boule D'or"),
                              SizedBox(height: Dimensions.height10,),
                              SmallText(text: "Talbourjt-Agadir"),
                              SizedBox(height: Dimensions.height10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTextWidget(icon: Icons.circle,
                                      text: "Normal",
                                      iconColor: AppColors.iconColor1),
                                  IconAndTextWidget(icon: Icons.location_on,
                                      text: "1.7km",
                                      iconColor: AppColors.mainColor),
                                  IconAndTextWidget(icon: Icons.access_time,
                                      text: "32 min",
                                      iconColor: AppColors.iconColor2),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
      ],
    );
  }
  Widget _buildPageItem(int index){
    Matrix4 matrix = new Matrix4.identity();
    if(index==_currPageValue.floor()){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if( index==_currPageValue.floor()+1 ){
      var currScale = _scaleFactor+(_currPageValue-index+1)*(1-_scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    }else if( index==_currPageValue.floor()-1 ){
      var currScale = 1-(_currPageValue-index)*(1-_scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      var currTrans = _height*(1-currScale)/2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale=0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)..setTranslationRaw(0, _height*(1-_scaleFactor)/2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(left: Dimensions.width10,right: Dimensions.width10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        "assets/image1.jpg"
                    )
                )
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(left: Dimensions.width30,right: Dimensions.width30, bottom: Dimensions.height30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0,5)
                  ),
                  BoxShadow(
                    color: Colors.white
                  )
                ]
              ),
              child: Container(
                padding: EdgeInsets.only(top: Dimensions.height15, left: 15,right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(text: "Caprice Agadir Bay",),
                    SizedBox(height: Dimensions.height10,),
                    Row (
                      children: [
                        Wrap(
                          children:  List.generate(5, (index) => Icon(Icons.star, color: AppColors.mainColor,size: 15,)),
                        ),
                        SizedBox(width: 10,),
                        SmallText(text: "4.5",),
                        SizedBox(width: 10,),
                        SmallText(text: "1285"),
                        SizedBox(width: 5,),
                        SmallText(text: "Comments")
                      ],
                    ),
                    SizedBox(height: Dimensions.height20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconAndTextWidget(icon: Icons.circle,
                            text: "Normal",
                            iconColor: AppColors.iconColor1),
                        IconAndTextWidget(icon: Icons.location_on,
                            text: "1.7km",
                            iconColor: AppColors.mainColor),
                        IconAndTextWidget(icon: Icons.access_time,
                            text: "32 min",
                            iconColor: AppColors.iconColor2),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
