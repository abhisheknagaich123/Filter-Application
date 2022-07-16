// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// class CURDApp extends StatefulWidget {
//   const CURDApp({Key? key}) : super(key: key);

//   @override
//   State<CURDApp> createState() => _CURDAppState();
// }

// class _CURDAppState extends State<CURDApp> {
//   TextEditingController name = TextEditingController();
//   TextEditingController email = TextEditingController();
//   final firebase = FirebaseFirestore.instance;

//   void create() async {
//     try {
//       await firebase.collection("user").doc(name.text).set({
//         "name": name.text,
//         "email": email.text,
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   void update() async {
//     try {
//       await firebase
//           .collection('user')
//           .doc(name.text)
//           .update({"email": email.text});
//     } catch (e) {
//       print(e);
//     }
//   }

//   void delete() {
//     try {
//       firebase.collection('user').doc(name.text).delete();
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Crud Firebase"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: ListView(
//           children: [
//             SizedBox(
//               height: 10,
//             ),
//             TextField(
//               keyboardType: TextInputType.number,
//               controller: name,
//               decoration: InputDecoration(
//                   labelText: "UserName",
//                   hintText: "Enter Username",
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10))),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             TextField(
//               keyboardType: TextInputType.number,
//               controller: email,
//               decoration: InputDecoration(
//                   labelText: "Email Address",
//                   hintText: "Enter Email Address",
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10))),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                     onPressed: () {
//                       create();
//                       name.clear();
//                       email.clear();
//                     },
//                     child: Text(
//                       "Create",
//                       style: TextStyle(fontSize: 20),
//                     )),
//                 ElevatedButton(
//                     onPressed: () {
//                       update();
//                       name.clear();
//                       email.clear();
//                     },
//                     child: Text(
//                       "Update",
//                       style: TextStyle(fontSize: 20),
//                     )),
//                 ElevatedButton(
//                     onPressed: () {
//                       delete();
//                       name.clear();
//                       email.clear();
//                     },
//                     child: Text(
//                       "Delete",
//                       style: TextStyle(fontSize: 20),
//                     )),
//               ],
//             ),
 
// // Read data from FireStore
//             Container(
//               margin: EdgeInsets.symmetric(vertical: 10),
//               height: 300,
//               width: double.infinity,
//               child: StreamBuilder<QuerySnapshot>(
//                   stream: firebase.collection('user').snapshots(),
//                   builder: (context, snapshot) {
//                     if (snapshot.hasData) {
//                       return ListView.builder(
//                           itemCount: snapshot.data!.docs.length,
//                           itemBuilder: (context, i) {
//                             QueryDocumentSnapshot x = snapshot.data!.docs[i];
//                             return Column(
//                               children: [
//                                 ListTile(
//                                   title: Text(x['name']),
//                                   subtitle: Text(x['email']),
//                                 ),
//                                 Divider(
//                                   height: 10,
//                                   thickness: 2,
//                                   color: Colors.red,
//                                 )
//                               ],
//                             );
//                           });
//                     } else {
//                       return Center(child: CircularProgressIndicator());
//                     }
//                   }),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }