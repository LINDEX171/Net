import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:netflix/pages/login_page.dart';
import 'package:netflix/services/firebase/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final User? user = Auth().currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      //?? au cas ou l'email n'existe pas
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text(
            user?.email ?? "user email",
            style: TextStyle(color: Colors.black, fontSize: 40),
          )),
          ElevatedButton(
              onPressed: () {
                Auth().signOutWithGoogle();

              },
              child: Text("logout"))
        ],
      ),
    );
  }
}
