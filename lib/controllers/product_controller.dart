import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../models/category_model.dart';

class ProductController extends GetxController {

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



}