import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override


  
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {



  final String? uid = FirebaseAuth.instance.currentUser!.displayName;
  final email = FirebaseAuth.instance.currentUser!.email;
  final creationTime = FirebaseAuth.instance.currentUser!.metadata.creationTime;
 


  User? user = FirebaseAuth.instance.currentUser;

  verifyEmail() async {
    if (user != null && !user!.emailVerified) {
      await user!.sendEmailVerification();
      print('Verification Email has benn sent');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.orangeAccent,
          content: Text(
            'Verification Email has benn sent',
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
        ),
      );
    }
  }

 Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: [
          Text(
            'User ID: $uid',
            style: TextStyle(fontSize: 18.0),
          ),
          Column(
            children: [
              Text(
                'Email: $email',
                style: TextStyle(fontSize: 18.0),
              ),
              user!.emailVerified
                  ? Text(
                      'verified' ,
                      style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 24, 107, 148)),
                    )
                  : TextButton(
                      onPressed: () => {verifyEmail()},
                      child: Text(' click To Verify Email',style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 212, 25, 19)),))
            ],
          ),
          Text(
            'Created: $creationTime',
            style: TextStyle(fontSize: 18.0),
          ),
          
        ],
      ),
    );
  }
}