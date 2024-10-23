import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture/view/homeScreen.dart';
import 'package:furniture/auth/login.dart';
import 'package:google_fonts/google_fonts.dart';
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController  =TextEditingController();
  TextEditingController userNameController  =TextEditingController();
  TextEditingController passwordController  =TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  checkValues({required String email, required  String pass, required String username ,required String conpass}){
    if(email==""||pass==""||username==""||conpass==" "){
      log("error");
    }
    else if(username.length<=2){
      log("error");
    }
    else if(pass!=conpass){
      log("error");
    }
    else{
      signUp();
    }

  }

  signUp()async{
    try {

      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.toString().trim(),
        password: passwordController.text.toString().trim(),
      ).then((value){
       storeData();
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

  }

 storeData()async{
    await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).set({
      "email":emailController.text.toString().trim(),
      "name":userNameController.text.toString().trim(), 
      "pass":passwordController.text.toString().trim(),
      "uid":FirebaseAuth.instance.currentUser!.uid,
      'type':"user",
      "image":'',
    }).then((value){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>homeScreen()));
    log("Account created");});
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/popularsofa1 (4).jpg",
           fit: BoxFit.cover,),


          ListView(
            children: [
              Column(
                children: [
                  SizedBox(height:50,),
                  Image.asset("assets/images/logo.png",height: 100,),
                  SizedBox(
                    height: 20,
                  ),
                  Text("Sign Up",style: GoogleFonts.akatab(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black87),),
                  SizedBox(
                    height: 10,
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
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      controller: userNameController,
                      decoration: InputDecoration(

                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide.none),
                        enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide.none),
                        labelText: 'Username...',
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
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
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
                    height: 10,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextField(
                      obscureText: true,
                      controller: confirmPasswordController,
                      decoration: InputDecoration(

                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide.none),
                        enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(25),borderSide: BorderSide.none),
                        labelText: 'Confirm Password',
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
                  Container(
                    height: 60,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: MaterialButton(color: Colors.black87,onPressed: (){
                      checkValues(email:emailController.text.toString() , pass:passwordController.text.toString() , username:userNameController.text.toString(),conpass: confirmPasswordController.text.toString());
                    },child: Text("Sign Up",style: GoogleFonts.poppins(color: Colors.white,fontSize:15),),),
                  ),
                  TextButton(onPressed: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  },
                      child: Text("LOGIN",style:
                      GoogleFonts.poppins(
                        color: Colors.blue,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                        decorationThickness: 2.0,
                        decorationStyle: TextDecorationStyle.solid,

                      ),)
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
