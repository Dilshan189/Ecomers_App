import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../consts/consts.dart';
import '../../controllers/cart_controller.dart';
import '../../services/filestore_service.dart';
import '../../widgets_common/loading_indicator.dart';


class wishlistscrren extends StatelessWidget {
  const wishlistscrren({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(CartController());


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: 'WishList'.text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
        stream: FirestoreServices.getWishlist(currentUser!.uid),
        builder: (BuildContext ,AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          }else{
            if(snapshot.data!.docs.isEmpty){
              return Center(
                child: "Wishlist is Empty".text.color(darkFontGrey).make(),
              );
            }else {
              var data = snapshot.data!.docs;
              controller.calculate(data);
              controller.productSnapshot = data;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, int index){
                              return ListTile(
                                leading: Image.network("${data[index]['img']}"
                                ),
                                title: "${data[index]['title']} (X${data[index]['qty']})"
                                    .text.fontFamily(semibold)
                                    .color(redColor)
                                    .size(16)
                                    .make(),
                                subtitle: "${data[index]['tprice']}"
                                    .numCurrency
                                    .text
                                    .fontFamily(semibold)
                                    .make(),


                                trailing: const Icon(
                                  Icons.delete,
                                  color: redColor,
                                )
                                    .onTap(() {
                                  FirestoreServices.deleteWishLiatDocument(data[index].id);
                                }),


                              );
                            })),

                  ],
                ),
              );
            }
          }
        },
      ),
    );
  }
}
