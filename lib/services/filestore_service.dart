import 'package:eroorhanler/consts/consts.dart';

class FirestoreServices {
  
  /// get user data /////////////////////////////////////////////////////////
  static getUser(uid){
    return firestore.collection(usresCollection).where('id',isEqualTo:uid).snapshots();
  }
}