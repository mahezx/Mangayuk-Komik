import 'package:flutter/material.dart';
import 'package:mangakuy_layout/firebase_options.dart';
import 'package:mangakuy_layout/screens/register_screen.dart';

import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/home_screen.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primarySwatch: ,
          ),
      home: LoginScreen(),

      //
      // Scaffold(
      //   body: HomeScreen(),
      //   floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      //   floatingActionButton: Container(
      //     padding : const EdgeInsets.only(left:10, right:10),
      //     height: 64,
      //     child: CustomNavigationBar(
      //       isFloating: true,
      //       borderRadius: const Radius.circular(15),
      //       selectedColor: Colors.white,
      //       unSelectedColor: Colors.grey,
      //       backgroundColor: Color(0xff2d272e),
      //       strokeColor: Colors.transparent,
      //       scaleFactor: 0.1,
      //       iconSize:30,
      //       items:[
      //         CustomNavigationBarItem(icon: _currentIndex == 0 ? Icon(Icons.home_rounded) : Icon(Icons.home_outlined)),
      //         CustomNavigationBarItem(icon: _currentIndex == 1 ? Icon(Icons.bookmark) : Icon(Icons.bookmark_border_outlined)),
      //         CustomNavigationBarItem(icon: _currentIndex == 2 ? Icon(Icons.explore) : Icon(Icons.explore_outlined)),
      //         CustomNavigationBarItem(icon: _currentIndex == 3 ? Icon(Icons.account_circle) : Icon(Icons.account_circle_outlined)),
      //       ],
      //       onTap:(index){
      //         setState(() {
      //           _currentIndex = index;
      //         });
      //       },

      //     )
      //   )
      // ),
    );
  }
}
