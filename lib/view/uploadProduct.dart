import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../auth/login.dart';
import '../firestoreServices.dart';

class uploadProduct extends StatelessWidget {
  uploadProduct({super.key});


  TextEditingController titleController =TextEditingController();
  TextEditingController priceController =TextEditingController();
  TextEditingController DesController =TextEditingController();
  Products( {required title,required price,required description})async{
    var storage=await FirebaseStorage.instance.ref("Products").child(name.toString()).putFile(imageFile as File);
    var imageUrl=await storage.ref.getDownloadURL();
    await FirebaseFirestore.instance.collection("Products").doc().set({
      "Title":title.toString(),
      "Price":price.toString(),
      "Description":description.toString(),
      "imageUrl":imageUrl,
      "uid":FirebaseAuth.instance.currentUser!.uid,
    });
  }
  String? name;
  File? imageFile;
  getImage()async{
    final ImagePicker picker = ImagePicker();
    await picker.pickImage(source:ImageSource.gallery).then((image){
      if(image==null){
        print("no image");
      }
      else{
        imageFile=File(image.path);
        name = image.name;
      }
    });
  }
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 70,),
              Text("Admin Dashboard",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black87,),),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(

                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide.none),
                    enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide.none),
                    labelText: "Enter title",
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,

                      color: Colors.black87,
                    ),

                    fillColor: Colors.grey.shade300.withOpacity(0.3),
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: priceController,
                  decoration: InputDecoration(

                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide.none),
                    enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide.none),
                    labelText: 'Enter price',
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,

                      color: Colors.black87,
                    ),

                    fillColor: Colors.grey.shade300.withOpacity(0.3),
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: DesController,
                  decoration: InputDecoration(

                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide.none),
                    enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide.none),
                    labelText: 'Enter Description...',
                    labelStyle: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,

                      color: Colors.black87,
                    ),

                    fillColor: Colors.grey.shade300.withOpacity(0.3),
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              OutlinedButton(onPressed: () {
                getImage();

              },
                child:Text("Upload Image",style: GoogleFonts.poppins(fontSize: 15),),
              ),
              OutlinedButton(onPressed: () {
                // FirebaseFirestore.instance.collection("Products").add("");
                Products(title: titleController.text.toString(),
                    price: priceController.text.toString(),
                    description: DesController.text.toString());


              },
                child:Text("Submit",style: GoogleFonts.poppins(fontSize: 15),),
              ),
              OutlinedButton(onPressed: ()async {
                await FirebaseAuth.instance.signOut();
                Navigator.popUntil(context, (route)=> route.isFirst);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));

              },
                child:Text("Logout",style: GoogleFonts.poppins(fontSize: 15),),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
