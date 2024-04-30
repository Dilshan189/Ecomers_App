import 'package:eroorhanler/consts/consts.dart';
import 'package:eroorhanler/consts/list.dart';
import 'package:eroorhanler/widgets_common/our_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IteamDetails extends StatelessWidget {
  final String? title;
  const IteamDetails({super.key,required this.title});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title!.text.color(fontGrey).fontFamily(bold).make(),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.share,)),
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.favorite_outline,)),
        ],
      ),
      body:  Column(
        children: [
           Expanded(
              child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ///swiper section///////////////////////////////////////////

                    VxSwiper.builder(
                      autoPlay: true,
                        height: 350,
                        itemCount: 3,
                        aspectRatio: 16/9,
                        itemBuilder: (context,index) {
                             return Image.asset(
                                 imgFc5,
                                  width: double.infinity,
                             fit: BoxFit.cover);
                    }),

                    10.heightBox,

                    ///title and Details selection//////////////////////////////

                    title!.text.size(16).color(darkFontGrey).fontFamily(semibold).make(),

                    10.heightBox,
                    ///rating //////////////////////////////////////////////////
                    
                    VxRating(
                      onRatingUpdate: (value){},
                      normalColor: textfieldGrey,
                      selectionColor: Colors.orangeAccent,
                      count: 5,
                      size: 25,
                      stepInt: true,),

                    10.heightBox,
                      "\$30.000".text.color(redColor).fontFamily(bold).size(18).make(),

                    10.heightBox,

                     Row(
                      children: [
                        Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Seller".text.white.fontFamily(semibold).make(),
                            5.heightBox,
                            "In House Brand".text.fontFamily(semibold).color(darkFontGrey).make(),

                          ],
                        )),
                         const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.message_rounded,color: darkFontGrey,),
                        ),
                      ],
                    ).box.height(60).padding(const EdgeInsets.symmetric(horizontal: 16)).color(textfieldGrey).make(),

                    ///color section////////////////////////////////////////////
                     20.heightBox,

                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color:".text.color(textfieldGrey).make(),
                            ),
                           
                            Row(
                              
                              children: List.generate(3, (index) => VxBox().size(40, 40)
                                  .roundedFull.color(Vx.randomPrimaryColor)
                                  .margin(const EdgeInsets.symmetric(horizontal: 4))
                                  .make(),

                            ),
                            ),

                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),

                        ///Quantity Row/////////////////////////////////////////

                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Quantity:".text.color(textfieldGrey).make(),
                            ),

                            Row(
                              children: [
                                IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
                                "0".text.size(16).color(darkFontGrey).fontFamily(bold).make(),
                                IconButton(onPressed: () {}, icon: const  Icon(Icons.add)),
                                10.widthBox,
                                "(0 available)".text.color(textfieldGrey).make(),
                              ],
                            ),

                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),

                        ///Total Section////////////////////////////////////////

                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total".text.color(textfieldGrey).make(),
                            ),
                            "\$0.00".text.color(redColor).size(16).fontFamily(bold).make(),

                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                      ],
                    ).box.white.shadowSm.make(),

                    ///Description Section//////////////////////////////////////

                  "Description".text.color(darkFontGrey).fontFamily(semibold).make(),
                    10.heightBox,
                    "This is a dummy item and dummy description here..".text.color(darkFontGrey).make(),



                    ///Button section///////////////////////////////////////////

                  10.heightBox,

                    ListView(
                      physics:const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                        itemDetailButtonList.length,
                            (index) => ListTile(
                        title: itemDetailButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                        trailing: const Icon(Icons.arrow_forward),
                      ),),
                    ),

                    20.heightBox,

                    ///product may like selection////////////////////////////////

                    productsyoumaylike.text.fontFamily(bold).size(16).color(darkFontGrey).make(),
                    10.heightBox,

                    ///i copied this widget from home screen featured products//

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
              )),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
              color: redColor,
              onPress: (){},
              textColor: whiteColor,
              title: "Add to Cart",
            ),
          )
        ],
      ),
    );
  }
}
