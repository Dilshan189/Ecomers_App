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
    return firestore.
    collection(productsCollection).
    where('p_category',isEqualTo: category)
        .snapshots();



  }

  ///get cart

static getCart(uid){
    return firestore
        .collection(cartCollection)
        .where('added_by',isEqualTo: uid)
        .snapshots();
}


///delete document

static deleteDocument(docId){
    return firestore
        .collection(cartCollection)
        .doc(docId)
        .delete();
}


///get all  chat messages


static getChatMessages(dicId){
    return firestore
        .collection(chatsCollection)
        .doc(dicId)
        .collection(messagesCollection)
        .orderBy('created_on', descending: false)
        .snapshots();
}



  ///get wishlist

  static getWishlist(uid){
    return firestore
        .collection(wishlistCollection)
        .where('added_by',isEqualTo: uid)
        .snapshots();
  }

  ///deleteWishlist document

  static deleteWishLiatDocument(docId){
    return firestore
        .collection(wishlistCollection)
        .doc(docId)
        .delete();
  }


}