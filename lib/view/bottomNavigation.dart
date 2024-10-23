import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:furniture/auth/login.dart';
import 'package:furniture/view/myCart.dart';

import 'homeScreen.dart';

class bottomNav extends StatefulWidget {
  const bottomNav({super.key});

  @override
  State<bottomNav> createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav> {
  int _selectedIndex = 0;
 List<Widget> screens=[
   homeScreen(),
   LoginScreen(),
   myCart(),
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled,color:Colors.grey,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.power_settings_new_rounded,color:Colors.grey,),
            label: 'Logout',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined,color:Colors.grey,),
            label: 'Cart',
          ),

        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        }
      ),


      body: screens.elementAt(_selectedIndex));
  }
}
