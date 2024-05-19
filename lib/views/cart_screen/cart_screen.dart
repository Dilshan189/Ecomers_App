import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eroorhanler/consts/consts.dart';
import 'package:eroorhanler/controllers/cart_controller.dart';
import 'package:eroorhanler/services/filestore_service.dart';
import 'package:eroorhanler/views/cart_screen/shipping_screen.dart';
import 'package:eroorhanler/widgets_common/loading_indicator.dart';
import 'package:eroorhanler/widgets_common/our_button.dart';
import 'package:get/get.dart';




class  CartScreen extends StatelessWidget {
  const  CartScreen ({super.key});

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(CartController());

    return Scaffold(

      backgroundColor: whiteColor,
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourButton(
                color: redColor,
                onPress: (){
                 Get.to(()=> const ShippingDetails()) ;
                },
                textColor: whiteColor,
                title: "Proceed to shipping"
            ),
      ),

      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "Shopping cart".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),

      body: StreamBuilder(
        stream: FirestoreServices.getCart(currentUser!.uid),
         builder: (BuildContext ,AsyncSnapshot<QuerySnapshot> snapshot) {
          if(!snapshot.hasData) {
            return Center(
           child: loadingIndicator(),
          );
          }else{
            if(snapshot.data!.docs.isEmpty){
              return Center(
                child: "Cart is Empty".text.color(darkFontGrey).make(),
              );
            }else {
              var data = snapshot.data!.docs;
              controller.calculate(data);

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
                                  FirestoreServices.deleteDocument(data[index].id);

                            }),


                          );
                        })),




                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Total Price"
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                        Obx(()=> "${controller.totalP.value}"
                              .numCurrency
                              .text
                              .fontFamily(semibold)
                              .color(redColor)
                              .make(),
                        ),
                      ],
                    )
                        .box
                        .padding(const EdgeInsets.all(12))
                        .color(lightGolden)
                        .roundedSM
                        .make(),

                    10.heightBox,

                    // SizedBox(
                    //   width:context.screenWidth,
                    //   child: ourButton(
                    //       color: redColor,
                    //       onPress: (){},
                    //       textColor: whiteColor,
                    //       title: "Proceed to shipping"
                    //   ),
                    // ),
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
