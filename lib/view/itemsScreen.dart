import 'package:flutter/material.dart';
import 'package:furniture/view/homeScreen.dart';
import 'package:google_fonts/google_fonts.dart';

class itemsScreen extends StatefulWidget {
  const itemsScreen({super.key});

  @override
  State<itemsScreen> createState() => _itemsScreenState();
}

class _itemsScreenState extends State<itemsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:Colors.grey.shade300,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                        child: Image.asset("assets/images/sofa2.png")),
                    Positioned(
                      top: 50,
                        left: 20,
                        child: InkWell(
                            onTap: (){
                              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>homeScreen()));

                            },
                            child: Icon(Icons.arrow_back,size: 25,color: Colors.black87,))),
                  ],
                ),
                Container(
                  width: 500,
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),

                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Artsy Chair",style: GoogleFonts.acme(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.black87,),),
                            CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.grey.withOpacity(0.1),
                                child: Icon(Icons.favorite_border_rounded)),
                          ],
                        ),
                        SizedBox(height:8 ,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("10.88\$",style: GoogleFonts.poppins(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black87),),
                            Text("Quantity: 1",style: GoogleFonts.poppins(fontWeight: FontWeight.bold,fontSize: 10,color: Colors.grey.shade300),),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Container(
                          child:Row(
                            children: [
                              Icon(Icons.star,color: Colors.orangeAccent,size: 20,),
                              Icon(Icons.star,color: Colors.orangeAccent,size: 20,),
                              Icon(Icons.star,color: Colors.orangeAccent,size: 20,),
                              Icon(Icons.star_border,color: Colors.orangeAccent,size: 20,),
                              Icon(Icons.star_border,color: Colors.orangeAccent,size: 20,),
                              Text("4",style: GoogleFonts.poppins(color: Colors.black87,fontSize: 12),)

                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Center(child: Text("Experience the epitome of luxury and comfort with our Izod Sofa. Crafted with meticulous attention to detail by our expert artisans, this leather sofa seat offers the perfect spot to unwind after a long day.",style: GoogleFonts.poppins(color: Colors.grey.shade300),)),
                        SizedBox(height: 20,),
                        Divider(thickness: 5,color: Colors.grey.shade300,),
                        SizedBox(height: 20,),
                        Text("Similar Products",style: GoogleFonts.poppins(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black87,),),
                        SizedBox(height:20),
                        Row(
                          children: [
                            Expanded(
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
                                            child: Image.asset("assets/images/popularsofa1 (4).png",
                                              height: 170,
                                            ),
                                          ),
                                          // SizedBox(height: ,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10,),
                                            child: Text("Artsy Sofa",style: GoogleFonts.acme(fontSize: 15,fontWeight: FontWeight.w900,color: Colors.black87,),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("10.88\$",style: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black87),),
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
                            ),
                            SizedBox(width: 10,),
                            Expanded(
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
                                            child: Image.asset("assets/images/sofa2.png",
                                              height: 170,
                                            ),
                                          ),
                                          // SizedBox(height: ,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10,),
                                            child: Text("Artsy Chair",style: GoogleFonts.acme(fontSize: 15,fontWeight: FontWeight.w900,color: Colors.black87,),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("10.88\$",style: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black87),),
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
                            ),

                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(
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
                                            child: Image.asset("assets/images/sofa3 (1).png",
                                              height: 170,
                                            ),
                                          ),
                                          // SizedBox(height: ,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10,),
                                            child: Text("Artsy Sofa",style: GoogleFonts.acme(fontSize: 15,fontWeight: FontWeight.w900,color: Colors.black87,),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("10.88\$",style: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black87),),
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
                            ),
                            SizedBox(width: 10,),
                            Expanded(
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
                                            child: Image.asset("assets/images/sofa3 (2).png",
                                              height: 170,
                                            ),
                                          ),
                                          // SizedBox(height: ,),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10,),
                                            child: Text("Artsy Chair",style: GoogleFonts.acme(fontSize: 15,fontWeight: FontWeight.w900,color: Colors.black87,),),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("10.88\$",style: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.black87),),
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
                            ),

                          ],
                        ),


                      ],
                    ),
                  ),


                ),

              ],
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
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        color: Colors.grey, // Border color
                        width: 4.0,         // Border width
                      ),

                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(Icons.favorite_border,color: Colors.grey,),
                  ),
                  Container(
                    width: 300,
                    child: MaterialButton(onPressed: (){},
                      color: Colors.black, // Sets the background color
                      textColor: Colors.white,
                      // Sets the text color
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                      child:Text("Add to cart",style: GoogleFonts.poppins(color: Colors.white,fontSize: 15,),),
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
