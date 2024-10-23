import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../components/itemsContainer.dart';
import '../firestoreServices.dart';

class allItems extends StatefulWidget {
  const allItems({super.key});

  @override
  State<allItems> createState() => _allItemsState();
}

class _allItemsState extends State<allItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Text('Items',style: GoogleFonts.poppins(fontWeight: FontWeight.w500),),

      ),
      body:Column(
        children: [
         Row(
           children: [
             SizedBox(height: 60,),
             StreamBuilder(stream: firestoreServices.getProducts(), builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
               if(!snapshot.hasData || snapshot.connectionState==ConnectionState.waiting){
                 return Center(child:LoadingAnimationWidget.waveDots(color: Colors.grey, size: 40),);
               }
               else{
                 var data=snapshot.data!.docs;
                 return Container(
                   height: 300,
                   child: ListView.builder(
                       itemCount: (data.length/2).ceil(),
                       itemBuilder: (context,index){
                         var firstIndex= index*2;
                         var secondIndex= firstIndex+1;
                         return Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Row(
                             children: [
                               Flexible(child:
                               ItemsContainer(data[index]["imageUrl"], data[index]["Title"],data[index]["Price"],)),
                               SizedBox(width: 10,),
                               secondIndex<data.length? Flexible(child: ItemsContainer(data[secondIndex]["imageUrl"], data[index]["Title"],data[index]["Price"])):Flexible(child: Container()),

                             ],
                           ),

                         );
                       }
                   ),
                 );
               }
             }
             )
           ],
         ),
        ],
      ) ,
    );
  }
}
