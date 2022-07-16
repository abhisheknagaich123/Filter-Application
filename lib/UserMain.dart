import 'package:filter_app/Filterscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'ChangePassword.dart';
import 'Dashboard.dart';
import 'Login.dart';
import 'Profile.dart';


class UserMain extends StatefulWidget {
  UserMain({Key? key}) : super(key: key);

  @override
  _UserMainState createState() => _UserMainState();
}

class _UserMainState extends State<UserMain> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Mainscreen(),
     Profile(),
    ChangePassword(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Welcome to Hybrid App"),
            
            
            ElevatedButton(
              onPressed: () async => {
                await FirebaseAuth.instance.signOut(),
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ),
                    (route) => false)
              },
              child: Text('Logout'),
              style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
            )
          ],
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_vintage),
            label: 'Filter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'My Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Change Password',
          ),
        ],
        type:BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}