import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix/pages/home_page.dart';
import 'package:netflix/pages/myhome_page.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAnimation();
  }

  Future<Timer> loadAnimation() async {
    return  Timer(Duration(seconds: 4), onLoaded);
  }

 onLoaded(){
   Navigator.of(context).pushReplacement(
     MaterialPageRoute(builder: (context) => MyhomePage(),)
   );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Lottie.asset("assets/lotties/netflix.json",repeat: false),)
    );
  }
}
