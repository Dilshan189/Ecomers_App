import 'package:eroorhanler/consts/consts.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';



class ProfileController extends GetxController {
  var profileImgPath = ''.obs;

  changeImage(context) async{
    try {
    final img = await ImagePicker().pickImage(source:ImageSource.gallery,imageQuality: 70);
    if(img == null)return;
    profileImgPath.value = img.path;
  } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    }

}
