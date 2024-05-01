import 'package:eroorhanler/consts/consts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../consts/firebase_consts.dart';

class AuthController extends GetxController {

  var isloading = false.obs;


  ///text controller////////////////////////////////////////////////////

  var emailController = TextEditingController();
  var passwordController = TextEditingController();



  String? get usersCollection => null;



  ///login method//////////////////////////////////////////////////////////

  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;

    try {
      userCredential =await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
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

  storeUserDta({name, password, email}) async {
    if (usersCollection != null) {
      DocumentReference store =  firestore.collection(usersCollection!).doc(currentUser!.uid);
      store.set({'name': name, 'password': password, 'email': email, 'imageUrl': '','id':currentUser!.uid},
      );
    } else {
      if (kDebugMode) {
        print("usersCollection is null!");
      }
    }
  }

/////////not data share in my database ////////////////////////

  ///sign-out method////////////////////////////////////////////////////////////

  signoutMethod(context) async {
    try {
      await auth.signOut();
    }catch (e){
      VxToast.show(context, msg: e.toString());
    }
  }
}


