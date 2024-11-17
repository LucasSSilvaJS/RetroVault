import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'pages/loginpage.dart';
import 'pages/profileimg.dart';
import 'pages/mainpage.dart';
import 'pages/perfilpage.dart';
import 'pages/purchasepage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RetroVault',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/profileimg': (context) => ProfileImg(),
        '/mainpage': (context) => MainPage(),
        '/login': (context) => LoginPage(),
        '/perfilpage': (context) => UserProfileScreen(),
        '/purchasepage': (context) => PurchaseScreen(),
      },
    );
  }
}
