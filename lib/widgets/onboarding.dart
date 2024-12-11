import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const Onboarding({
     Key?  key,
    required this.title,
    required this.subtitle,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(image,fit: BoxFit.cover,)),
        Positioned.fill(child: Container(
          color: Colors.black.withOpacity(0.8),
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Text(
            textAlign: TextAlign.center,
            title, style: TextStyle( color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text(textAlign: TextAlign.center, subtitle,style: TextStyle(color: Colors.white, fontSize: 20),)
        ],),))
      ],
    );
  }
}
