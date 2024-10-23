import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:furniture/view/homeScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../components/CardItems.dart';
import '../components/itemsContainer.dart';
import '../firestoreServices.dart';

class myCart extends StatefulWidget {
  const myCart({super.key});

  @override
  State<myCart> createState() => _myCartState();
}

class _myCartState extends State<myCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade400,

      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60,),
                  InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>homeScreen()));
                    },
                      child: Icon(Icons.arrow_back,color: Colors.black87,size: 25,)),
                  SizedBox(height:10 ,),
                  Text("My Shopping Bag",style: GoogleFonts.poppins(fontSize:25,fontWeight: FontWeight.bold,color: Colors.blueGrey.shade700,),),
                  SizedBox(height: 10,),

              StreamBuilder(stream: firestoreServices.getMyCart(), builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
                if(!snapshot.hasData || snapshot.connectionState==ConnectionState.waiting){
                  return Center(child:LoadingAnimationWidget.waveDots(color: Colors.grey, size: 40),);
                }
                else{
                  var data=snapshot.data!.docs;
                  return Container(
                    height: 200,

                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context,index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CartItems(data[index]["image"], data[index]["title"],data[index]["price"]),
                          );
                        }
                    ),
                  );
                }
              }
              ),


                            SizedBox(height: 10,),
                           Divider(color: Colors.grey.shade400, thickness: 5.0,),
                              SizedBox(height: 20,),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [


                            Flexible(
                              child: SizedBox(
                                width: 300.0,
                                height: 60.0,
                           child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search_rounded,size: 20,color: Colors.grey.shade300,),
                            labelText: "Insert your coupon code",
                            labelStyle: GoogleFonts.poppins(fontSize: 12,color: Colors.grey.shade300),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Color(0xFFa6adad), width: 2.0),
                            ),

                          ),

                        ),
                      ),),
                      SizedBox(width: 10,),
                      Container(
                        width: 100,
                        height: 60,
                        child: MaterialButton(onPressed: (){},
                          color: Colors.blueGrey.shade700, // Sets the background color
                          textColor: Colors.white,
                          // Sets the text color
                          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                          child:Text("Apply",style: GoogleFonts.poppins(color: Colors.white,fontSize: 15,),),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Divider(color: Colors.grey.shade400, thickness: 5.0,),
                  SizedBox(height: 30,),
                  Text("Sofa you might like",style: GoogleFonts.poppins(fontSize:16,fontWeight: FontWeight.bold,color: Colors.blueGrey.shade700,),),
                  SizedBox(height: 10,),
                  StreamBuilder(stream: firestoreServices.getShoppingCart(), builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
                    if(!snapshot.hasData || snapshot.connectionState==ConnectionState.waiting){
                      return Center(child:LoadingAnimationWidget.waveDots(color: Colors.grey, size: 40),);
                    }
                    else{
                      var data=snapshot.data!.docs;
                      return Container(
                        height: 300,
                        child: ListView.builder(
                            itemCount:( data.length/2).ceil(), 

                            itemBuilder: (context,index){
                              var firstIndex= index*2;
                              var secondIndex= firstIndex+1;
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Flexible(child: ItemsContainer(data[firstIndex]["image"], data[index]["title"],data[index]["price"])),
                                   SizedBox(width: 10,),
                                   secondIndex<data.length? Flexible(child: ItemsContainer(data[secondIndex]["image"], data[index]["title"],data[index]["price"])):Flexible(child: Container()),
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
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(height: 80,width: double.infinity,color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(height: 10,),
                      Text("Total",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.grey.shade300),),
                      SizedBox(height:7 ,),
                      Text("10.88\$",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black87),),

                    ],
                  ),
                  Container(
                    width: 300,
                    child: MaterialButton(onPressed: (){},
                      color: Colors.blueGrey.shade700, // Sets the background color
                      textColor: Colors.white,
                      // Sets the text color
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      child:Text("Proceed to checkout",style: GoogleFonts.poppins(color: Colors.white,fontSize: 15,),),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),


    );

  }

}




// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
//
// import '../firestoreServices.dart';
//
// class myCart extends StatelessWidget {
//   const myCart({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Container(
//         child:     StreamBuilder(stream: firestoreServices.getMyCart(), builder: (context,AsyncSnapshot<QuerySnapshot>snapshot){
//           if(!snapshot.hasData || snapshot.connectionState==ConnectionState.waiting){
//             return Center(child:LoadingAnimationWidget.waveDots(color: Colors.grey, size: 40),);
//           }
//           else{
//             var data=snapshot.data!.docs;
//             return Container(
//
//               child: ListView.builder(
//                   itemCount: data.length,
//                   itemBuilder: (context,index){
//                     return Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: ItemsContainer(data[index]["image"], data[index]["title"],data[index]["price"]),
//                     );
//                   }
//               ),
//             );
//           }
//         }
//         ),
//       ),
//     );
//   }
//   Widget ItemsContainer(String imageUrl,String title,String price){
//     return  Container(
//       height:300,
//       child: Stack(
//         children: [
//           InkWell(
//
//             onTap:(){
//               // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>itemScreen()));
//
//             },
//             child: Container(
//               height: 300,
//               decoration: BoxDecoration(
//                   color: Colors.grey.shade300,
//                   borderRadius: BorderRadius.circular(20)
//               ),
//               child:Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Center(
//                     child: Image.network(imageUrl,
//                       height: 170,
//                     ),
//                   ),
//                   // SizedBox(height: ,),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10,),
//                     child: Text(title,style: GoogleFonts.acme(fontSize: 15,fontWeight: FontWeight.w900,color: Colors.black87,),),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(price,style: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black87),),
//                         Row(
//                           children: [
//                             Text("4",style: GoogleFonts.poppins(fontSize: 13,color: Colors.black87),),
//                             Icon(Icons.star_border,color: Colors.orangeAccent,),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   SizedBox(height:2 ),
//                   Center(
//                     child: OutlinedButton(
//                       onPressed: (){},
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: Colors.blue, // Sets the background color
//
//                         padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Sets padding
//                       ),
//                       child:
//                       Text("Add to Cart",style: GoogleFonts.abel(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black87,),),
//
//                     ),
//                   ),
//
//                 ],
//               ),
//             ),
//           ),
//
//           Positioned(
//               right:14,top: 10,
//               child: CircleAvatar(
//                   radius: 15,
//                   backgroundColor: Colors.white.withOpacity(0.3),
//                   child: Icon(Icons.favorite_border_rounded))),
//         ],
//       ),
//     );
//   }
// }
