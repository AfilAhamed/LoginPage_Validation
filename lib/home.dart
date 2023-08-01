import 'package:flutter/material.dart';
import 'package:login_pagee_task/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Products"),
          actions: [
            IconButton(
                onPressed: () {
                  signout(context);
                },
                icon: const Icon(
                  Icons.exit_to_app,
                ))
          ],
        ),
        body: SafeArea(
            child: ListView.separated(
          itemBuilder: (ctx, index) {
            return ListTile(
              title: Text('List${index + 1}'),
              leading: const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage('assets/images/List logo.jpg'),
              ),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: 20,
        )));
  }
}

signout(BuildContext ctx) async {
  final _sharedPrefs = await SharedPreferences.getInstance();
  await _sharedPrefs.clear();

  Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => LoginPage()), (route) => false);
}
