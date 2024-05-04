import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eroorhanler/consts/consts.dart';
import 'package:eroorhanler/consts/list.dart';
import 'package:eroorhanler/controllers/auth_controller.dart';
import 'package:eroorhanler/controllers/profile_controler.dart';
import 'package:eroorhanler/services/filestore_service.dart';
import 'package:eroorhanler/views/profile_screen/components/details_cart.dart';
import 'package:eroorhanler/views/profile_screen/components/edit_profile_screen.dart';
import 'package:eroorhanler/widgets_common/bg_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../auth_screen/login_screen.dart';

class  ProfilSecreen extends StatelessWidget {
  const  ProfilSecreen ({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(ProfileController());

    return  bgWidget(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUser!.uid),

          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

            if(!snapshot.hasData){
              return const Center(child: CircularProgressIndicator(
                valueColor:AlwaysStoppedAnimation(redColor) ,
              ),
              );
            }

            else {
              return  SafeArea(
                child: Column(
                  children: [

                    ///Edit profile button/////////////////////////////////////////

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                          alignment: Alignment.topRight,
                          child: Icon(Icons.edit,color: whiteColor)).onTap(() { }),
                    ),




                    ///User details section/////////////////////////////////////////

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Image.asset(imgProfile2,
                              width: 80,
                              fit: BoxFit.cover)
                              .box.roundedFull
                              .clip(Clip.antiAlias)
                              .make(),

                          10.widthBox,


                          Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  "Dummy User".text.fontFamily(semibold).white.make(),
                                  5.heightBox,
                                  "Customer@example.com".text.white.make(),
                                ],
                              )),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: whiteColor,
                              ),
                            ),
                            onPressed: () async {
                              await Get.put(AuthController()).signoutMethod(context);
                              Get.offAll(() => const LoginScreen());
                            },
                            child: "logout".text.fontFamily(semibold).white.make(),
                          )
                        ],
                      ),
                    ),

                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        detailsCard(count: "00",title: "in your cart",width: context.screenWidth / 3.4),
                        detailsCard(count: "32",title: "in your wishList",width: context.screenWidth / 3.4),
                        detailsCard(count: "675",title: "your orders",width: context.screenWidth / 3.4),
                      ],
                    ),

                    ///button section//////////////////////////////////////////////


                    ListView.separated(
                      shrinkWrap: true,
                      separatorBuilder: ( context,index) {
                        return const Divider(
                          color: lightGrey,
                        );
                      },
                      itemCount: profileButtonList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return  ListTile(
                          leading: Image.asset(profileButtonIcon[index],
                            width: 22,
                          ),
                          title:profileButtonList[index].text.fontFamily(semibold).color(darkFontGrey).make() ,
                        );
                      },
                    ).box.white.rounded
                        .margin(const EdgeInsets.all(12))
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .shadowSm.make().box.color(redColor)
                        .make(),

                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
