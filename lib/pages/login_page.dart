import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:netflix/services/firebase/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;
  bool _isLogin = true;
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
                    controller: _emailController,
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
                    controller: _passwordController,
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
                  SizedBox(height: 20),
                  if (!_isLogin)
                    TextFormField(
                      controller: _passwordConfirmController,
                      obscureText: _obscureText,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                          labelText: "Password confirmation",
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
                        } else if (value != _passwordController.text) {
                          return "the two password doesn't match";
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
                        onPressed: _isLoading
                            ? null
                            : () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    _isLoading = true;
                                  });
                                  //do something
                                  // print(_emailController.text);
                                  // print(_passwordController.text);

                                  //LOGIN
                                  try {
                                    if (_isLogin) {
                                      await Auth().loginWithEmailAndPassword(
                                        _emailController.text,
                                        _passwordController.text,
                                      );
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    } else {
                                      await Auth()
                                          .createUserWithEmailAndPassword(
                                              _emailController.text,
                                              _passwordController.text);
                                      setState(() {
                                        _isLoading = false;
                                      });
                                    }
                                  } on FirebaseAuthException catch (e) {
                                    setState(() {
                                      _isLoading = false;
                                    });
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
                        child: _isLoading
                            ? CircularProgressIndicator(
                                color: Colors.red,
                              )
                            : Text(
                                _isLogin ? "Sign In" : "Register",
                                style: TextStyle(fontSize: 20),
                              )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (_isLogin)
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
                    child: _isLogin
                        ? ElevatedButton.icon(
                            onPressed: () {
                              Auth().signInWithGoogle();
                            },
                            icon: Image.asset(
                                width: 30,
                                height: 30,
                                "assets/images/google.png"),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(),
                                backgroundColor: Colors.grey[800],
                                foregroundColor: Colors.white),
                            label: Text(
                              "Login with Google",
                              style: TextStyle(fontSize: 20),
                            ))
                        : null,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  if (_isLogin)
                    Text(
                      "Forgot password ?",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  SizedBox(
                    height: 40,
                  ),
                  if (_isLogin)
                    Text(
                      "sign in a protected by Google reCAPTCHA to ensure you are not a bot.LEARN MORE",
                      style: TextStyle(color: Colors.white, fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                  _isLogin
                      ? SizedBox(
                          height: 40,
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _isLogin
                          ? Text(
                              "J'ai pas de compte,",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                              textAlign: TextAlign.center,
                            )
                          : Text(
                              "J'ai un compte,",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              ),
                              textAlign: TextAlign.center,
                            ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            _emailController.text = "";
                            _passwordController.text = "";
                            _passwordConfirmController.text = "";
                            _isLogin = !_isLogin;
                          });
                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  RegisterPage(),));
                        },
                        child: _isLogin
                            ? Text(
                                "s'inscrire",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 17,
                                ),
                                textAlign: TextAlign.center,
                              )
                            : Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 17,
                                ),
                                textAlign: TextAlign.center,
                              ),
                      )
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
