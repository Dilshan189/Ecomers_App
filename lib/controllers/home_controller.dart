import 'package:eroorhanler/consts/consts.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  @override
  void onTnit(){
    getUsername();
    super.onInit();
  }

  var currentNavIndex = 0. obs;

  var username = '';

  getUsername() async {
   var n = await firestore.collection(usresCollection).where('id',isEqualTo: currentUser!.uid).get().then((value) {
      if(value.docs.isNotEmpty){
        return value.docs.single['name'];
      }
    });


   username = n;


  }



}