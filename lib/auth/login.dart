
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture/view/adminHomeScreen.dart';
import 'package:furniture/view/bottomNavigation.dart';
import 'package:furniture/view/homeScreen.dart';
import 'package:furniture/auth/signUp.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController =TextEditingController();
  TextEditingController passController =TextEditingController();
  bool isSignedIn = false;
  bool hasAccount = false;
  checkValues( {required String email, required String pass}){
    if(email==""||pass==""){
      var snackBar = SnackBar(content: Text('Kindly fill all fields'),backgroundColor: Colors.red,);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else {
      signIn();
    }
  }

  signIn() async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.toString().trim(),
        password:passController.text.toString().trim(),
      ).then((userCred){
      var user=  FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get().then((value){
        if(value['type']=="admin"){
          Navigator.popUntil(context, (route)=>route.isFirst);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>adminDashboard()));
        }
        else {
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>bottomNav()));
        }
      });

        var snackBar = SnackBar(backgroundColor: Colors.green,content: Text('Successfully loggedin'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homeScreen()));
      });

    }on FirebaseAuthException catch(e){
      var snackBar = SnackBar(backgroundColor: Colors.red,content: Text(e.message.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

    }


  }
  // signUp()async{
  //   try {
  //     final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: emailController.text.toString().trim(),
  //       password: passController.text.toString().trim(),
  //     ).then((value){
  //       print("Account created");
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       print('The password provided is too weak.');
  //     } else if (e.code == 'email-already-in-use') {
  //       print('The account already exists for that email.');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  //   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homeScreen()));
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/popularsofa1 (6).jpg",
          fit: BoxFit.cover,),


          ListView(
            children: [
              Column(
                children: [
                  SizedBox(height:90,),
                  Image.asset("assets/images/logo.png",height: 100,),
                  SizedBox(
                    height: 40,
                  ),
                  Text("Login",style: GoogleFonts.akatab(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black87),),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(

                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide.none),
                        enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide.none),
                        labelText: 'Enter Email...',
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


                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      obscureText: true,
                      controller: passController,
                      decoration: InputDecoration(

                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide.none),
                        enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide.none),
                        labelText: 'Password',
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
                  SizedBox(
                    height: 30,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: MaterialButton(color: Colors.black87,onPressed: (
                            ){
                          checkValues(email:emailController.text.toString(),pass:passController.text.toString(),);
                        },child: Text("login",style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),),
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Container(
                        height: 50,
                        child: MaterialButton(color: Colors.black87,

                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => SignUp()),
                            );
                          },
                          child: Text(" Sign up",style: GoogleFonts.poppins(color: Colors.white,fontSize: 15),),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ],
          ),




        ],
      ),
    );
  }
}

// for better control
// checkValues( {required String email, required String pass}){
//   if(email==""||pass==""){
//     var snackBar = SnackBar(content: Text('Kindly fill all fields'),backgroundColor: Colors.red,);
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
//   else {
//     signIn().then((userCred){
//       if(userCred!=null){
//         var snackBar = SnackBar(backgroundColor: Colors.green,content: Text('Successfully loggedin'));
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homePage()));
//       }
//
//
//     });
//   }
// }
//
// signIn() async{
//   UserCredential? credential;
//   try{
//     credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: emailController.text.toString().trim(),
//       password:passController.text.toString().trim(),
//     );
//
//   }on FirebaseAuthException catch(e){
//     var snackBar = SnackBar(backgroundColor: Colors.red,content: Text(e.code.toString()));
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//
//   }
//
//   return credential;
//
//
// }