import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../firestoreServices.dart';

addToCart(title,imgUrl,price) async{
  await FirebaseFirestore.instance.collection("Cart").doc().set({
    "title":title.toString(),
    "image":imgUrl.toString(),
    "price":price.toString(),
    "email": FirebaseAuth.instance.currentUser!.email,

  });
}
      Widget CartItems(String imageUrl,String title,String price) {
        return StreamBuilder(stream: firestoreServices.getMyCart(),
            builder: (context, AsyncSnapshot<QuerySnapshot>snapshot){
              if (snapshot.hasData) {
                var data = snapshot.data!.docs;
                print("data found");
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 90,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFFa6adad),

                          ),
                          child: Image.network(imageUrl,
                            height: 170,
                          ),
                        ),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(title, style: GoogleFonts.acme(fontSize: 15,
                              fontWeight: FontWeight.w900,
                              color: Colors.blueGrey.shade700,),),
                            SizedBox(height: 5,),
                            Text("Qty: 1", style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                fontSize: 7,
                                color: Colors.grey.shade400),),
                            SizedBox(height: 5,),
                            Text(price, style: GoogleFonts.poppins(fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey.shade700),),


                          ],
                        ),
                        SizedBox(width: 110,),

                        Column(
                          children: [
                            InkWell(
                                onTap: () {
                                  var data = snapshot.data!.docs;

                                  FirebaseFirestore.instance.collection(
                                      "Cart").doc(data[index].id).delete();
                                },
                                child: Icon(Icons.highlight_remove_sharp,
                                  color: Colors.orangeAccent, size: 25,)),
                            SizedBox(height: 15,),

                            Row(
                              children: [
                                Text(
                                  "4", style: GoogleFonts.poppins(color: Colors
                                    .black87, fontSize: 12),),
                                Icon(Icons.star_border_rounded,
                                  color: Colors.orangeAccent, size: 15,)

                              ],
                            ),
                          ],
                        ),
                      ],
                      );
                    }
                );

              }
              else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }
        );
      }
