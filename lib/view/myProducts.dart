import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../firestoreServices.dart';

class myProducts extends StatelessWidget {
  const myProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child:     StreamBuilder(stream: firestoreServices.getProducts(), builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
          if(!snapshot.hasData || snapshot.connectionState==ConnectionState.waiting){
            return Center(child:LoadingAnimationWidget.waveDots(color: Colors.grey, size: 40),);
          }
          else{
            var data=snapshot.data!.docs;
            return Container(

              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ItemsContainer(data[index]["imageUrl"], data[index]["Title"],data[index]["Price"]),
                    );
                  }
              ),
            );
          }
        }
        ),
      ),
    );
  }
  Widget ItemsContainer(String imageUrl,String title,String price){
    return  Container(
      height:300,
      child: Stack(
        children: [
          InkWell(

            onTap:(){
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>itemScreen()));

            },
            child: Container(
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
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
                    child: Text(title,style: GoogleFonts.acme(fontSize: 15,fontWeight: FontWeight.w900,color: Colors.black87,),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(price,style: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black87),),
                        Row(
                          children: [
                            Text("4",style: GoogleFonts.poppins(fontSize: 13,color: Colors.black87),),
                            Icon(Icons.star_border,color: Colors.orangeAccent,),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height:2 ),
                  Center(
                    child: OutlinedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.blue, // Sets the background color

                        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Sets padding
                      ),
                      child:
                      Text("Add to Cart",style: GoogleFonts.abel(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black87,),),

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
                  child: Icon(Icons.favorite_border_rounded))),
        ],
      ),
    );
  }
}
