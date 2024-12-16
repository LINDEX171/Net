import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailTextField =  TextEditingController();
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
                height: 60,
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
                  if( value == null || value==value.isEmpty){
                    return "please enter Email";
                  }else if(!value.contains("@")){
                    return "please enter a valid email adress";
                  }else if(!value.contains(".")){
                    return "please enter a valid email adress";
                  }
                  return null ;
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
                  if( value == null || value.isEmpty){
                    return "please enter password";
                  }
                  return null ;
                },
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red,foregroundColor: Colors.white,shape: RoundedRectangleBorder()),
                    onPressed: () {
                      if(_formKey.currentState!.validate()){
                      //do something
                        print(_emailTextField.text);
                        print(_passwordTextField.text);
                      }

                    }, child: Text("Sign In",style: TextStyle(fontSize: 20),)),
              )
            ],
          )),
        ),
      ),
    );
  }
}
