import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class firestoreServices{
  static getUser(){
   return FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).snapshots();
  }
  static getAllUsers(){
    return FirebaseFirestore.instance.collection("users").snapshots();
  }
  static getAllBags(){
    return FirebaseFirestore.instance.collection("bags").snapshots();
  }
  static getABags(){
    return FirebaseFirestore.instance.collection("bags").doc("Stylo").snapshots();
  }
  static getShoppingCart(){
    return FirebaseFirestore.instance.collection("Cart").snapshots();
  }
  static getProducts(){
    return FirebaseFirestore.instance.collection("Products").snapshots();
  }
  static getMyCart(){
    return FirebaseFirestore.instance.collection("Cart").where('email',isEqualTo:FirebaseAuth.instance.currentUser!.email).snapshots();
  }
  static getMyProducts(){
    return FirebaseFirestore.instance.collection("Products").where("uid",isEqualTo: FirebaseAuth.instance.currentUser!.uid).snapshots();
  }
}