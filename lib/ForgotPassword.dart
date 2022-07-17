import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import 'Filter/colors.dart';
import 'Filter/resuable.dart';
import 'Signup.dart';
import 'Login.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  var email = "";

  final emailController = TextEditingController();

  @override
  void dispose() {
   
    emailController.dispose();
    super.dispose();
  }

   Future resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.trim());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Password Reset Email has been sent !',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      );
       Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Login(),
          ),
        );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Color.fromARGB(255, 48, 204, 0),
            content: Text(
              'No user found for that email.',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: Container(
        //  padding: EdgeInsets.symmetric(vertical: 50),
           decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              hexStringToColor("CB2B93"),
              hexStringToColor("9546C4"),
              hexStringToColor("5E61F4")
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: Column(
            children: [
              logoWidget("images/logo123.png"),
              Container(
                
                margin: EdgeInsets.only(top: 20.0),
                child: Text(
                  'Reset Link will be sent to your email id !',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                            autofocus: false,
                            decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelText: 'password: ',
                           labelStyle: TextStyle(color: Colors.white,
                        fontSize: 22,
                        ),
                          hintText: 'password',
                          fillColor: Colors.white,
                          prefixIcon:
                              Icon(Icons.password_outlined, color: Colors.white70),
                          
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 25.0, horizontal: 10.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32.0)),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.white, width: 2.0),
                            borderRadius: BorderRadius.circular(200.0),
                          ),
                          errorStyle:
                              TextStyle(color: Colors.redAccent, fontSize: 15),
                        ),
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please Enter Email';
                              } else if (!value.contains('@')) {
                                return 'Please Enter Valid Email';
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 60.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // Validate returns true if the form is valid, otherwise false.
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      email = emailController.text;
                                    });
                                    resetPassword();
                                  }
                                },
                                child: Text(
                                  'Send Email',
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ),
                              TextButton(
                                onPressed: () => {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, a, b) => Login(),
                                        transitionDuration: Duration(seconds: 0),
                                      ),
                                      (route) => false)
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(fontSize: 17,color: Colors.white70),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an Account? ",style: TextStyle(fontSize: 17,color: Colors.white70),),
                              TextButton(
                                  onPressed: () => {
                                        Navigator.pushAndRemoveUntil(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (context, a, b) =>
                                                  Signup(),
                                              transitionDuration:
                                                  Duration(seconds: 0),
                                            ),
                                            (route) => false)
                                      },
                                  child: Text('Signup',style: TextStyle(fontSize: 17,color: Colors.white70),))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}