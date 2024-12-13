import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 
 
   bool _obscureText = true ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        toolbarHeight: 80,
        backgroundColor: Colors.black,
        title: Center(
            child: Image.asset(
          "assets/images/logo.png",
          height: 60,
        )),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Help",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
              child: Column(
            children: [
              SizedBox(height: 60,),
              TextFormField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  labelText: "Email or phone",
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: _obscureText,
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[800],
                  border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide.none),
                suffixIcon: IconButton(onPressed: () {
                     setState(() {
                       _obscureText = !_obscureText;
                     });
                }, icon: _obscureText ? Icon(Icons.visibility,color: Colors.white,):Icon(Icons.visibility_off,color: Colors.white,) )
                ),
                
              )
            ],
          )),
        ),
      ),
    );
  }
}
