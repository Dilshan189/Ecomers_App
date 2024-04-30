import 'package:eroorhanler/components/featured_button.dart';
import 'package:eroorhanler/consts/colors.dart';
import 'package:eroorhanler/consts/consts.dart';
import 'package:eroorhanler/consts/list.dart';
import 'package:eroorhanler/widgets_common/home_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class  HomeScreen extends StatelessWidget {
  const  HomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {



    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: context.screenWidth,
      height: context.screenHeight,
      child: SafeArea(child:Column(
        children: [
          Container(
            alignment: Alignment.center,
            height:60,
            color: lightGrey,
            child: TextFormField(
              decoration: const InputDecoration(
                border:InputBorder.none,
                suffixIcon: Icon(Icons.search),    /// added search Button ////////
                filled: true,
                fillColor: whiteColor,
                hintText:searchanything,
                hintStyle: TextStyle(color: textfieldGrey),
              ),
            ),
          ),

          10.heightBox,

          /// swiper brands //////////////////////////////////  card auto play /////////////////////////////

        Expanded(
          child: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
          
            child: Column(
              children: [

                VxSwiper.builder(
                    aspectRatio: 16/9,
                    autoPlay: true,
                    height: 150,
                    enlargeCenterPage: true,
                    itemCount:sliderList.length,
                    itemBuilder: (context,index) {
                      return Image.asset(
                        sliderList[index],
                        fit: BoxFit.fill,
                      ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
                    }),
            
                15.heightBox,
            
                //deals buttons added
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(2, (index) => homeButtons(
                    height:context.screenHeight * 0.15,
                    width:context.screenWidth / 2.5,
                    icon: index == 0 ? icTodaysDeal : icFlashDeal,
                    title: index == 0 ? todayDeal :flashsale,
                  )),
                ),
            
                /// 2nd swiper ///////////////////////////////////////////////////////
            
                15.heightBox,

                VxSwiper.builder(
                    aspectRatio: 16/9,
                    autoPlay: true,
                    height: 150,
                    enlargeCenterPage: true,
                    itemCount:secondSliderList.length,
                    itemBuilder: (context,index) {
                      return Image.asset(
                        secondSliderList[index],
                        fit: BoxFit.fill,
                      ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
                    }),


            
                /// category buttons ///////////////////////////////////////////////
            
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(3, (index) => homeButtons(
                    height:context.screenHeight * 0.15,
                    width:context.screenWidth / 3.5,
                    icon: index == 0 ? icTopCategories : index == 1 ? icBrands : icTopSeller,
                    title: index == 0 ? topCategories : index == 1 ? brand :topSEllers,
                  )),
                ),
            
                ///featured categories////////////////////////////////////////////////
            
                20.heightBox,
            
                Align(
                  alignment: Alignment.centerLeft,
                  child: featuredCategories.text.color(darkFontGrey).size(18).fontFamily(semibold).make(),
                ),

                20.heightBox,

                SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(3, (index) => Column(
                      children: [
                        featuredButoon(icon: featuredImages1[index],title: featuredTitleS1[index]),
                        10.heightBox,
                        featuredButoon(icon: featuredImages2[index],title: featuredTitleS2[index]),
                      ],
                    )),
                  ),
                ),

              20.heightBox,
                ///featured product/////////////////////////////////////////////

                Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: const BoxDecoration(color: redColor),
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      featuredProduct.text.white.fontFamily(bold).size(18).make(),
                      10.heightBox,
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(6, (index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(imgP1,width: 150,fit: BoxFit.cover,
                              ),
                              10.heightBox,
                              "Laptop 4GB/64GB".text.fontFamily(semibold).color(Colors.black).make(),
                              10.heightBox,
                              "\$600".text.fontFamily(semibold).color(Colors.red).size(18).make(),
                            ],
                          ).box.white.margin(const EdgeInsets.symmetric(horizontal:4)).roundedSM.padding(const EdgeInsets.all(8)).make()),
                        ),
                      ),
                    ],
                  ),
                ),


                ///third swiper////////////////////////////////////////////////
                  20.heightBox,

                VxSwiper.builder(
                    aspectRatio: 16/9,
                    autoPlay: true,
                    height: 150,
                    enlargeCenterPage: true,
                    itemCount:secondSliderList.length,
                    itemBuilder: (context,index) {
                      return Image.asset(
                        secondSliderList[index],
                        fit: BoxFit.fill,
                      ).box.rounded.clip(Clip.antiAlias).margin(const EdgeInsets.symmetric(horizontal: 8)).make();
                    }),

                20.heightBox,


                /// all product  section ///////////////////////////////////////
                  
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8,mainAxisExtent: 300),
                  itemBuilder: (context,index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      imgP5,
                      height:200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                    const Spacer(),
                    "Laptop 4GB/64GB".text.fontFamily(semibold).color(Colors.black).make(),
                    10.heightBox,
                    "\$600".text.fontFamily(semibold).color(Colors.red).size(18).make(),
                  ],

                ).box.white.margin(
                    const EdgeInsets.symmetric(horizontal:4))
                    .roundedSM
                    .padding(
                    const EdgeInsets.all(12))
                    .make();
              })
              ],
            ),
          ),
        ),
      ],
    )));
  }
}

 String get brand => "Brand";



