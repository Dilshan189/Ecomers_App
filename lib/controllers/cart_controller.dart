import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eroorhanler/controllers/home_controller.dart';
import 'package:get/get.dart';
import '../consts/consts.dart';

class CartController extends GetxController {
  var totalP = 0.obs;

  /// text controller for shipping details

  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var postalCodeController = TextEditingController();
  var phoneController = TextEditingController();

  var paymentIndex = 0.obs;


  late dynamic productSnapshot;
  var products = [];




  calculate(data) {
    totalP.value = 0;
    for (var i = 0; i < data.length; i++) {
      totalP.value = totalP.value + int.parse(data[i]['tprice'].toString());
    }
  }

  changePaymentIndex(index) {
    paymentIndex.value = index;
  }

  placeMyorder({required orderPaymentMethod,  required totalAmount}) async {
    await getPrtoductDetails();
    await firestore.collection(ordersCollection).doc().set({
      'order_code':"233981237",
      'order_date':FieldValue.serverTimestamp(),
      'order_by ': currentUser!.uid,
      'order_by_name':Get.find<HomeController>().username,
      'order_by_email':currentUser!.email,
      'order_by_address':addressController.text,
      'order_by_state':stateController.text,
      'order_by_city':cityController.text,
      'order_by _phone':phoneController.text,
      'order_by_postcode':postalCodeController.text,
      'shipping+method':"Home Delivery",
      'payment_method':orderPaymentMethod,
      'order_placed':true,
      'order_confirmed':false,
      'order_delivery':false,
      'order_on_delivery':false,
      'total_amount':totalAmount,
      'orders':FieldValue.arrayUnion(products),

    });
  }

  getPrtoductDetails() {
    products.clear();
    for (var i = 0; i < productSnapshot.length; i++) {
      products.add({
        'color':productSnapshot[i]['color'],
        'img':productSnapshot[i]['img'],
        'qty':productSnapshot[i]['qty'],
        'title':productSnapshot[i]['title'],


      });

    }
  }



}
