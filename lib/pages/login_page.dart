import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:netflix/pages/home_page.dart';
import 'package:netflix/pages/redirection_page.dart';
import 'package:netflix/services/firebase/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextField = TextEditingController();
  final _passwordTextField = TextEditingController();
  bool _obscureText = true;
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
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 110,
                  ),
                  TextFormField(
                    controller: _emailTextField,
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
                    validator: (value) {
                      if (value == null || value == value.isEmpty) {
                        return "please enter Email";
                      } else if (!value.contains("@")) {
                        return "please enter a valid email adress";
                      } else if (!value.contains(".")) {
                        return "please enter a valid email adress";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordTextField,
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
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            icon: _obscureText
                                ? Icon(
                                    Icons.visibility,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.visibility_off,
                                    color: Colors.white,
                                  ))),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please enter password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder()),
                        onPressed: () async {
                          //LOGIN
                          if (_formKey.currentState!.validate()) {
                            //do something
                            // print(_emailTextField.text);
                            // print(_passwordTextField.text);
                            try {
                              await Auth().loginWithEmailAndPassword(
                                  _emailTextField.text,
                                  _passwordTextField.text);
                            } on FirebaseAuthException catch (e) {
                              //Message Error
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("${e.message}"),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.red,
                                showCloseIcon: true,
                              ));
                            }
                          }
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "OR",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(),
                            backgroundColor: Colors.grey[800],
                            foregroundColor: Colors.white),
                        onPressed: () {},
                        child: Text(
                          "Use a Sign-in Code",
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Forgot password ?",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "sign in a protected by Google reCAPTCHA to ensure you are not a bot.LEARN MORE",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                    textAlign: TextAlign.center,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
