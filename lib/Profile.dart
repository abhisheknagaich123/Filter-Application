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
// String name='is loading...';


// void getdata() async{
// User? user= await FirebaseAuth.instance.currentUser;
// var vari=await FirebaseFirestore.instance.collection('user').doc(user?.uid).get();
// print(vari.data()!['username']);
// // setState(() {
// // print(vari.data()?['username']);
 
// // });
// }

// @override
//   void initState() {
//     // TODO: implement initState
//     getdata();
//     super.initState();
//   }


  final uid = FirebaseAuth.instance.currentUser!.uid;
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        children: [
          
          Row(
            children: [
              
              Text(
                'email:$email',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
           
          
         
         user!.emailVerified
                  ? Text(
                     'uid:$uid'
                      ,style: TextStyle(fontSize: 18.0, color: Colors.blueGrey),
                    )
                  : TextButton(
                      onPressed: () => {verifyEmail()},
                      child: Text('Verify Email')),
          Text(
            'Created: $creationTime',
            style: TextStyle(fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}