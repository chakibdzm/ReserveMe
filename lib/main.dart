import 'package:flutter/material.dart';
import 'package:reserve_me/Screens/Home/Home.dart';
import 'package:reserve_me/Screens/Reserver/Reserve.dart';

import 'Screens/Splash/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  const SplashScreen(),
    );
  }
}
