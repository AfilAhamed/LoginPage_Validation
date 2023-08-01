import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_pagee_task/home.dart';
import 'package:login_pagee_task/login_page.dart';
import 'package:login_pagee_task/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    checkuserloggedin();
  }

  Future<void> gotologin() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/fluttter logo.jpg',
          height: 300,
        ),
      ),
    );
  }

  Future<void> checkuserloggedin() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userloggedin = _sharedPrefs.getBool(SAVE_KEY_NAME);
    if (_userloggedin == null || _userloggedin == false) {
      gotologin();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => Home()));
    }
  }
}
