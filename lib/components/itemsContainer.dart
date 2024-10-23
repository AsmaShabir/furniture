import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture/view/itemsScreen.dart';
import 'package:google_fonts/google_fonts.dart';

addToCart(title,imgUrl,price) async{
  await FirebaseFirestore.instance.collection("Cart").doc().set({
    "title":title.toString(),
    "image":imgUrl.toString(),
    "price":price.toString(),
    "email": FirebaseAuth.instance.currentUser!.email,

  });
}

Widget ItemsContainer(String imageUrl,String title,String price){
  return  Container(
    height:300,
    child: Stack(
      children: [
        InkWell(

          onTap:(){
             // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>itemsScreen()));

          },
          child: Container(
            height: 300,
            decoration: BoxDecoration(
                color: Color(0xFFa6adad),
                borderRadius: BorderRadius.circular(20)
            ),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(imageUrl,
                    height: 170,
                  ),
                ),
                // SizedBox(height: ,),
                Padding(
                  padding: const EdgeInsets.only(left: 10,),
                  child: Text(title,style: GoogleFonts.acme(fontSize: 15,fontWeight: FontWeight.w900,color: Colors.blueGrey.shade700,),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(price,style: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.blueGrey.shade700),),
                      Row(
                        children: [
                          Text("4",style: GoogleFonts.poppins(fontSize: 13,color: Colors.blueGrey.shade700),),
                          Icon(Icons.star_border,color: Colors.orangeAccent,),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height:2 ),
                Center(
                  child: OutlinedButton(
                    onPressed: (){
                      addToCart(title, imageUrl, price);

                    },
                    style: ElevatedButton.styleFrom(
                      // foregroundColor: Colors.blue, // Sets the background color

                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Sets padding
                    ),
                    child:
                    Text("Add to Cart",style: GoogleFonts.abel(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.blueGrey.shade700,),),

                  ),
                ),

              ],
            ),
          ),
        ),

        Positioned(
            right:14,top: 10,
            child: CircleAvatar(
                radius: 15,
                backgroundColor: Colors.white.withOpacity(0.3),
                child: Icon(Icons.favorite_border_rounded,color: Colors.blueGrey.shade700,))),
      ],
    ),
  );
}

