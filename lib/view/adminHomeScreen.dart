import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture/view/uploadProduct.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../auth/login.dart';
import '../firestoreServices.dart';
import 'myProducts.dart';
class adminDashboard extends StatelessWidget {
  const adminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox( width: double.infinity,
        child: Column(mainAxisSize: MainAxisSize.max, mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(color: Colors.blue,onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> uploadProduct()));
            },
            child: Text("Add Products"),) ,
            MaterialButton(color: Colors.blue,onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> myProducts()));
            },
            child: Text("My Product"),),
          ],
        ),
      ),
    );
  }
}
