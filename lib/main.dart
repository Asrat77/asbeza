import 'package:asbeza/views/home_screen.dart';
import 'package:asbeza/views/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/home_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: MaterialApp(
        initialRoute: "/",
        routes: {
          "/": (context)=> const home_screen(),
          "/profile": (context)=> const ProfilePage(),
        },

        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),

      ),
    );
  }





}
