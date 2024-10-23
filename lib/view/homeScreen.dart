
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:furniture/auth/login.dart';
import 'package:furniture/view/all.dart';
import 'package:furniture/view/itemsScreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../components/itemsContainer.dart';
import '../firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../firestoreServices.dart';
import 'myCart.dart';


class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {


  addToCart(title,imgUrl,price) async{
   await FirebaseFirestore.instance.collection("Products").doc().set({
     "title":title.toString(),
     "image":imgUrl.toString(),
     "price":price.toString(),

   });
  }
  User ? user = FirebaseAuth.instance.currentUser;



  String? namee;
  File? imageFile;
  getImage()async{
    final ImagePicker picker = ImagePicker();
    await picker.pickImage(source:ImageSource.gallery).then((image){
      if(image==null){
        print("no image");
        // Text(user?.email?.substring(0, 1).toUpperCase() ?? 'U');


      }
      else{
        imageFile=File(image.path);
        namee = image.name;
        updateImage();
      }
    });
  }
   updateImage()async{
    var storage=await FirebaseStorage.instance.ref("profileImage").child(FirebaseAuth.instance.currentUser!.uid).putFile(imageFile as File);
    var imageUrl=await storage.ref.getDownloadURL();
    // await user?.updateProfile(photoURL: photoURL);

    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
      // "email":email.toString(),

      "image":imageUrl.toString(),

    });

  }
  
@override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFFd4d8d9),
      appBar: AppBar(
        backgroundColor: Color(0xFFa6adad),
        foregroundColor: Colors.blueGrey.shade700,
        title: Text('Home',style: GoogleFonts.poppins(fontWeight: FontWeight.w500),),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade300,
        child: StreamBuilder(
          stream: firestoreServices.getUser() ,
          builder: (context, AsyncSnapshot<DocumentSnapshot>snapshot) {
            if(!snapshot.hasData|| snapshot.connectionState==ConnectionState.waiting){

              return Center(child: LoadingAnimationWidget.hexagonDots(color: Colors.black87, size: 45),);

            }
            else{
            var data=snapshot.data!;
            return ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
            UserAccountsDrawerHeader(
            accountName: Text(data['name']),
            accountEmail: Text(user?.email??'email'),
            currentAccountPicture: InkWell(
              onTap: (){
                getImage();
              },
              child: CircleAvatar(
              backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(data['image'],),
                child:  data['image']==""?Icon(Icons.person):Container()),
              ),
            ),
                  ]
                );
          }}
        ),
    ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Explore What",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blueGrey.shade700),),
                 InkWell(
                   onTap: (){
                    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>myCart()));

                   },

                     child: CircleAvatar(
                        radius:25 ,
                         backgroundColor: Color(0xFFd4d8d9).withOpacity(0.3),
                         child: Icon(Icons.shopping_cart_outlined,color: Colors.blueGrey.shade700,size: 30,))),

               ],
             ),
              SizedBox(height: 7,),
              Text("Your Home Needs",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blueGrey.shade700),),
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search_rounded,size: 20,color: Colors.orangeAccent,),
                  labelText: "Chair,desk,lamp,etc",
                  labelStyle: GoogleFonts.poppins(fontSize: 12,color: Colors.orangeAccent),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.orangeAccent, width: 2.0),
                  ),

                ),

              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Categories",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.blueGrey.shade700,),),
                  Row(
                    children: [
                      Text("See all",style: GoogleFonts.poppins(fontSize: 10,color: Colors.orangeAccent),),
                      Icon(Icons.arrow_forward,size: 16,color: Colors.orangeAccent,),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>allItems()));

                      },
                        child: Categories("assets/images/chair.png", "Chair")),
                    SizedBox(width: 8,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>allItems()));

                      },
                        child: Categories("assets/images/sofa.png", "Sofa")),
                    SizedBox(width: 8,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>allItems()));

                      },
                        child: Categories("assets/images/desk.png", "Desk"))
                  ],
                ),
              ),
             SizedBox(height: 20,),
             Stack(
               children: [
                 ClipRRect(
                   borderRadius: BorderRadius.only(topRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
                     child: Image.asset("assets/images/sofasale (1).jpg")),
                 Positioned(
                   top: 20,
                     left: 10,
                     child: Text("upto 70% off",style: GoogleFonts.alef(color: Colors.blueGrey.shade700,fontWeight: FontWeight.bold,fontSize: 20),)),
                 Positioned(
                   top: 50,
                     left: 10,
                     child: Text("High Quality Sofa Started",style: GoogleFonts.alef(color: Colors.blueGrey.shade700,fontWeight: FontWeight.bold,fontSize: 12),)),
                 Positioned(
                     bottom: 15,
                     right: 9,
                     child: Row(
                       children: [
                         Text("See all items",style: GoogleFonts.alef(color: Colors.blueGrey.shade700,fontWeight: FontWeight.bold,fontSize: 12),),
                         Icon(Icons.arrow_forward,color: Colors.blueGrey.shade700,size: 20,)
                       ],
                     )),

                 ]
                ),
               SizedBox(height: 20,),

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("Popular",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.blueGrey.shade700,),),

                   Row(
                     children: [
                       Text("See all",style: GoogleFonts.poppins(fontSize: 10,color: Colors.orangeAccent),),
                       Icon(Icons.arrow_forward,size: 16,color: Colors.orangeAccent,),
                     ],
                   ),
                 ],
               ),
              SizedBox(height: 20,),
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
                               Flexible(child: ItemsContainer(data[index]["imageUrl"], data[index]["Title"],data[index]["Price"],)),
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
              // Row(
              //   children: [
              //     Expanded(
              //        child: Stack(
              //             children: [
              //              InkWell(
              //
              //                onTap:(){
              //                   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>itemScreen()));
              //                  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>SofaScreen()));
              //
              //                    },
              //                  child: Container(
              //                   height: 300,
              //                   decoration: BoxDecoration(
              //                     color: Colors.grey.shade300,
              //                     borderRadius: BorderRadius.circular(20)
              //                   ),
              //                   child:Column(
              //                     crossAxisAlignment: CrossAxisAlignment.start,
              //                     children: [
              //     Center(
              //       child: Image.asset("assets/images/popularsofa1 (4).png",
              //         height: 170,
              //       ),
              //     ),
              //     // SizedBox(height: ,),
              //     Padding(
              //       padding: const EdgeInsets.only(left: 10,),
              //       child: Text("Artsy Sofa",style: GoogleFonts.acme(fontSize: 15,fontWeight: FontWeight.w900,color: Colors.black87,),),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text("10.88\$",style: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black87),),
              //           Row(
              //             children: [
              //               Text("4",style: GoogleFonts.poppins(fontSize: 13,color: Colors.black87),),
              //               Icon(Icons.star_border,color: Colors.orangeAccent,),
              //             ],
              //           )
              //         ],
              //       ),
              //     ),
              //     SizedBox(height:2 ),
              //     Center(
              //       child: OutlinedButton(
              //         onPressed: (){
              //           addToCart("Artsy Sofa","assets/images/popularsofa1 (4).png","1662\$ ");
              //         },
              //         style: ElevatedButton.styleFrom(
              //           foregroundColor: Colors.blue, // Sets the background color
              //
              //           padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Sets padding
              //         ),
              //         child:
              //         Text("Add to Cart",style: GoogleFonts.abel(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black87,),),
              //
              //       ),
              //     ),
              //
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //
              //               Positioned(
              //                   right:14,top: 10,
              //                   child: CircleAvatar(
              //                    radius: 15,
              //     backgroundColor: Colors.white.withOpacity(0.3),
              //     child: Icon(Icons.favorite_border_rounded))),
              //                     ],
              //                   ),
              //                 ),
              //     SizedBox(width: 10,),
              //     Expanded(
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
              //                     child: Image.asset("assets/images/sofa2.png",
              //                       height: 170,
              //                     ),
              //                   ),
              //                   // SizedBox(height: ,),
              //                   Padding(
              //                     padding: const EdgeInsets.only(left: 10,),
              //                     child: Text("Artsy Chair",style: GoogleFonts.acme(fontSize: 15,fontWeight: FontWeight.w900,color: Colors.black87,),),
              //                   ),
              //                   Padding(
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Row(
              //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                       children: [
              //                         Text("10.88\$",style: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black87),),
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
              //                       onPressed: (){
              //                         addToCart("Artsy Sofa","assets/images/popularsofa1 (4).png","1662\$ ");
              //
              //                       },
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
              //     ),
              //
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
Widget Categories( String imageUrl, String title,){
  return Container(
    height: 70,
    width: 150,
    decoration: BoxDecoration(
      color: Color(0xFFa6adad),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(imageUrl,height: 50,),
        Text(title,style: GoogleFonts.poppins(fontSize: 13,color: Colors.blueGrey.shade700,fontWeight: FontWeight.w500),),


      ],
    ),
  );
  // return Container(
  //   child: Column(
  //     children: [
  //              Container(
  //                height: 50,
  //                width: 100,
  //                decoration: BoxDecoration(
  //                  color: Color(0xFFa6adad),
  //                  borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
  //                ),
  //                  child: Image.asset(imageUrl,height: 50,)),
  //             Text(title,style: GoogleFonts.poppins(fontSize: 13,color: Colors.black,fontWeight: FontWeight.w500),),
  //
  //
  //     ],
  //   ),
  // );
}
