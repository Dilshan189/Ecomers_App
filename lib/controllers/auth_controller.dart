import 'package:eroorhanler/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../consts/firebase_consts.dart';

class AuthController extends GetxController {
  String? get usersCollection => null;




  ///login method//////////////////////////////////////////////////////////

  Future<UserCredential?> loginMethod({email,password,context}) async {
    UserCredential? userCredential;

    try {
      userCredential =await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }
///Signup method//////////////////////////////////////////////////////////

  Future<UserCredential?> signupMethod({email,password,context}) async {
    UserCredential? userCredential;

    try {
      userCredential =await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  ///storing data ,method//////////////////////////////////////////////////

storeUserDta({name,password,email}) async {

    DocumentReference store = await firestore.collection(usersCollection!).doc(currentUser!.uid);
    store.set({'name':name, 'password':password, 'email':email, 'imageUrl':''});
}

///sign-out method////////////////////////////////////////////////////////////

  signoutMethod(context) async {
    try {
      await auth.signOut();
    }catch (e){
        VxToast.show(context, msg: e.toString());
  }
}
}