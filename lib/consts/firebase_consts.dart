import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth= FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
User? currentUser = auth.currentUser;

///collections///////////////////////////////////////////////////////////////

const usresCollection = "users";
const productsCollection = "products";
const cartCollection = "Cart";
const chatsCollection = 'Chats';
const messagesCollection = 'messages';

const ordersCollection = 'orders';

const wishlistCollection = "wishlist";