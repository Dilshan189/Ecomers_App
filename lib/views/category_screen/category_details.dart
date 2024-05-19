import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eroorhanler/consts/consts.dart';
import 'package:eroorhanler/controllers/product_controller.dart';
import 'package:eroorhanler/services/filestore_service.dart';
import 'package:eroorhanler/views/category_screen/iteam_details.dart';
import 'package:eroorhanler/widgets_common/bg_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../widgets_common/loading_indicator.dart';


class CategoryDetails extends StatelessWidget {
 final  String? title;
  const CategoryDetails ({Key? key, required this.title}) :super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.find<ProductController>();


    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title!.text.fontFamily(bold).white.make(),
          ),
        body:StreamBuilder(stream: FirestoreServices.getProducts(title),
            builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(!snapshot.hasData){
            return Center(
              child: loadingIndicator(),
            );
          }else if(snapshot.data!.docs.isEmpty){
            return Center(
              child: "No products found!".text.color(darkFontGrey).make(),
            );
          }else{

            var data = snapshot.data!.docs;

            return Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          controller.subcat.length,
                              (index) =>"${controller.subcat[index]}"
                              .text
                              .size(12)
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .makeCentered()
                              .box
                              .white
                              .rounded
                              .size(150,60)
                              .margin(const EdgeInsets.symmetric(horizontal: 4))
                              .make()),
                    ),
                  ),


                  ///items container////////////////////////////////////////////////

                  20.heightBox,

                  Expanded(
                    child: GridView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: data.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 240,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                      ),

                      itemBuilder: (context,index){
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              data[index]['p_imgs'][0],
                              height:150,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                            const Spacer(),
                            "${data[index]["p_name"]}".text.fontFamily(semibold).color(Colors.black).make(),
                            10.heightBox,
                            "${data[index]["p_price"]}".numCurrencyWithLocale().text.fontFamily(semibold).color(Colors.red).size(18).make(),
                          ],

                        ).box.white.margin(const EdgeInsets.symmetric(horizontal:4))
                            .roundedSM
                            .outerShadowSm
                            .padding(const EdgeInsets.all(12))
                            .make().onTap(() {
                              controller.checkIfFav(data[index],context);
                          Get.to(() => IteamDetails(title: "${data[index]["p_name"]}",data: data[index],));
                        });
                      },
                    ),
                  ),
                ],
              ),
            );
          }},
        ),
      ),
    );
  }
}
