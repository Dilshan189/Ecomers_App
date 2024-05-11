import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/category_model.dart';

class ProductController extends GetxController {

  var quantity = 0.obs;
  var colorIndex = 0.obs;
  var totalPrice = 0.obs;
  var subcat =[];




  getSubCategories(title) async{
    subcat.clear();
    var data = await rootBundle.loadString("lib/services/category_mode.json");
    var decoded = catrgoryModelFromJson(data);
    var s = decoded.categories.where((element)  => element.name == title).toList();

    for (var e in s[0].subcategory){
      subcat.add(e);
    }
  }

changeColorIndex(index){
    colorIndex = index;

}

increaseQuantity(totalQuantity){
if(quantity.value < totalQuantity) {
  quantity.value++;
}
}
decreaseQuantity(){
    if(quantity.value > 0) {
      quantity.value--;
    }
}

calculateTotalPrice(price){
    totalPrice.value =  price * quantity.value;
}
}
