import 'package:flutter/material.dart';
import 'package:login_pagee_task/home.dart';
import 'package:login_pagee_task/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _getusername = TextEditingController();

  final _getpassword = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "UserName",
                        hintText: "Enter your username"),
                    controller: _getusername,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'please enter your username';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Password",
                          hintText: "Enter your Password"),
                      controller: _getpassword,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter your password';
                        } else {
                          return null;
                        }
                      }),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          loginpagechecking(context);
                        }
                      },
                      child: const Text('Login'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void loginpagechecking(BuildContext ctx) async {
    final _username = _getusername.text;
    final _password = _getpassword.text;
    if (_username == _password) {
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => const Home()));
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(const SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.all(10),
          backgroundColor: Colors.black,
          content: Text("Username and password does not match")));
    }
  }
}
