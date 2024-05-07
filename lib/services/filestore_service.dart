import 'package:eroorhanler/consts/consts.dart';

class FirestoreServices {
  
  /// get user data /////////////////////////////////////////////////////////
  static getUser(uid) {
    return firestore.collection(usresCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

    ///get products according to category/////////////////////////////////////

  static getProducts(category){
    return firestore.collection(productsCollection).where('p_category',isEqualTo: category).snapshots();



  }
}