import 'dart:ffi';

import 'package:eroorhanler/consts/consts.dart';
import 'package:eroorhanler/consts/list.dart';
import 'package:eroorhanler/controllers/cart_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets_common/our_button.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod ({super.key});

  // get orderPaymentMethod => null;
  // get totalAmount => null;

  @override
  Widget build(BuildContext context) {


    var controller = Get.find<CartController>();


    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar:SizedBox(
        height: 60,
        child: ourButton(
          onPress: (){
           controller.placeMyorder(orderPaymentMethod: paymentMethods[controller.paymentIndex.value],totalAmount: controller.totalP.value);
          },
          color: redColor,
          textColor: whiteColor,
          title:"Place My Oder",
        ),
      ),
      appBar: AppBar(
        title: "Choose Payment Method".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(()=> Column(
            children:List.generate(paymentMethodsimg.length, (index) {
              return GestureDetector(
                onTap: () {
                  controller.changePaymentIndex(index);
          
                },
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color:controller.paymentIndex.value == index ? redColor : Colors.transparent,
                        width:4,
                    ),
                  ),
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.asset(
                          paymentMethodsimg[index],
                          width:double.infinity,
                          height: 120,
                          colorBlendMode:controller.paymentIndex.value == index ? BlendMode.darken : BlendMode.color,
                          color: controller.paymentIndex.value == index ?Colors.black.withOpacity(0.4) : Colors.transparent,
                          fit: BoxFit.cover),
                      controller.paymentIndex.value == index ?Transform.scale(
                        scale:1.3,
                      child: Checkbox(
                        activeColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                          value: true,
                          onChanged: (value) {}
                      ),
                ):Container(),
                      Positioned(
                        bottom: 0,
                        right: 10,
                        child: paymentMethods[index].text.white.fontFamily(semibold).size(16).make()),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),

    );
  }
}
