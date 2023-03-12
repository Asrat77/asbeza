import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

Widget buildNavBar(BuildContext context){
  return Scaffold(

      bottomNavigationBar:  GNav(


      tabs: [
      GButton(icon: Icons.home, text: "Home",onPressed: (){Navigator.pushNamed(context, "/");},),
  GButton(icon: Icons.shopping_cart,text: "History"),
  GButton(icon: Icons.account_circle,text: "Profile",onPressed: (){Navigator.pushNamed(context, "/profile");},),
  GButton(icon: Icons.settings,text: "Profile",)

  ],

  ),
  );
}