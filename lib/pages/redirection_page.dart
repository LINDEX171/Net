import 'package:flutter/material.dart';
import 'package:netflix/pages/home_page.dart';
import 'package:netflix/pages/login_page.dart';
import 'package:netflix/services/firebase/auth.dart';

class RedirectionPage extends StatefulWidget {
  const RedirectionPage({super.key});

  @override
  State<RedirectionPage> createState() => _RedirectionPageState();
}

class _RedirectionPageState extends State<RedirectionPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: Auth().authStateChanges, builder: (context, snapshot) {
      if(snapshot.connectionState == ConnectionState){
        return CircularProgressIndicator();
      }else if(snapshot.hasData){
      return HomePage();
      }else {
        return LoginPage();
      }
    },);
  }
}
