import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eroorhanler/consts/consts.dart';
import 'package:eroorhanler/services/filestore_service.dart';
import 'package:eroorhanler/widgets_common/loading_indicator.dart';
import 'package:flutter/widgets.dart';

class wishlistaa extends StatelessWidget {
  const wishlistaa ({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "My Wishlist".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getwishlist(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
          if(!snapshot.hasData){
            return Center(
              child: loadingIndicator(),
            );
          }else if (snapshot.data!.docs.isEmpty) {
            return "No Wishlist yet!".text.color(darkFontGrey).fontFamily(semibold).makeCentered();
          }else{
            return Container();
          }
        },
      ),
    );
  }
}
