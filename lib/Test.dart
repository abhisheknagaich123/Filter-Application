// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:gallery_saver/gallery_saver.dart';

// class Test extends StatefulWidget {
//   const Test({Key? key}) : super(key: key);

//   @override
//   State<Test> createState() => _TestState();
// }

// class _TestState extends State<Test> {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       body: Center(
//         child: 

//                  Padding(
//                     padding: const EdgeInsets.all(0.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: 640,
//                           height: 480,
//                           alignment: Alignment.center,
//                           decoration: BoxDecoration(
//                             color: Colors.grey,
//                             image: DecorationImage(
//                                 image: FileImage(imageFile!),
//                                 fit: BoxFit.cover),
//                             // border: Border.all(width: 8, color: Colors.black),
//                             borderRadius: BorderRadius.circular(12.0),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           children: [
//                             Expanded(
//                               child: ElevatedButton(
//                                   onPressed: () {},
//                                   child: const Text('Share',
//                                       style: TextStyle(fontSize: 18))),
//                             ),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             Expanded(
//                               child: ElevatedButton(
//                                   onPressed: () async {
//                                     await GallerySaver.saveImage(
//                                         imageFile!.path);
//                                         print(imageFile!.path);
//                                     ScaffoldMessenger.of(context).showSnackBar(
//                                       SnackBar(
//                                         backgroundColor: Colors.orangeAccent,
//                                         content: Text(
//                                           ' images Save',
//                                           style: TextStyle(fontSize: 18.0),
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   child: const Text('Save',
//                                       style: TextStyle(fontSize: 18))),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   )),
 
     
//     );
//   }
// }