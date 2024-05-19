import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eroorhanler/consts/consts.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/category_model.dart';

class ProductController extends GetxController {

  var quantity = 0.obs;
  var colorIndex = 0.obs;
  var totalPrice = 0.obs;
  var subcat =[];



  var isFav = false.obs;


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
    colorIndex  = index;

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

addToCart({title,img,sellername,color,qty,tprice,context}) async {
    await firestore.collection(cartCollection).doc().set({
      'title':title,
      'img':img,
      'seller name':sellername,
      'color':color,
      'qty':qty,
      'tprice':tprice,
      'added_by':currentUser!.uid

    }).catchError((error){
      VxToast.show(context, msg: error.toString());
    });
}

resetValues(){
   totalPrice.value = 0;
   quantity.value = 0;
   colorIndex.value = 0;
}


addToWishlist(docId, BuildContext context)async {
    await firestore
        .collection(productsCollection)
        .doc(docId).set({
      'p_wishlist':FieldValue.arrayUnion([
        currentUser!.uid])
    },SetOptions(merge: true));
    isFav(false);

}


  removeFromWishlist(docId,context)async {
    await firestore
        .collection(productsCollection)
        .doc(docId).set({
      'p_wishlist':FieldValue.arrayRemove([
        currentUser!.uid])
    },SetOptions(merge: true));

    isFav(true);
    VxToast.show(context, msg: "Add to wishlist");


  }

checkIfFav(data,context)async{
    if(data['p_wishlist'].contains(currentUser!.uid)){
      isFav(true);
    }else{
      isFav(false);
      VxToast.show(context, msg: "Removed from favorite");
    }
}



}
