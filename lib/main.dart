import 'package:flutter/material.dart';
import 'pages/homepage.dart';
import 'pages/profileimg.dart';

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
      },
    );
  }
}
