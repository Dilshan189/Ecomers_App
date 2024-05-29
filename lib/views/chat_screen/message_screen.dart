import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eroorhanler/consts/consts.dart';
import 'package:eroorhanler/services/filestore_service.dart';
import 'package:eroorhanler/widgets_common/loading_indicator.dart';
import 'package:flutter/widgets.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen ({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "My Message".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getAllMessages(),
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
          if(!snapshot.hasData){
            return Center(
              child: loadingIndicator(),
            );
          }else if (snapshot.data!.docs.isEmpty) {
            return "No Message yet!".text.color(darkFontGrey).fontFamily(semibold).makeCentered();
          }
          else
          {
            var data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context , int index){
                return ListTile(
                  title: data[index]['order_code'].toString().text.color(redColor).fontFamily(semibold).make(),
                  subtitle: data[index]['total_amount'].toString().numCurrency.text.fontFamily(semibold).make(),
                );
              },
            );

          }
        },
      ),
    );
  }
}
