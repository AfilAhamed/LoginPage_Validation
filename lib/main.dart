import 'package:flutter/material.dart';
import 'package:login_pagee_task/splashscreen.dart';

const SAVE_KEY_NAME = 'UserLoggedIn';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "login page",
      home: SplashScreen(),
    );
  }
}
