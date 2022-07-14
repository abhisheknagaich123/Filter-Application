// import 'dart:io';

// import 'package:filter_app/Filter.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final GlobalKey _globalKey = GlobalKey();
//   final List<List<double>> filters = [
//     SEPIA_MATRIX,
//     GREYSCALE_MATRIX,
//     VINTAGE_MATRIX,
//     SWEET_MATRIX
//   ];

//   File? imageFile;

//   @override
//   Widget build(BuildContext context) {
//     // final Size size = MediaQuery.of(context).size;
//     // final Image image = Image.file(imageFile!);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Image Filters",
//         ),
//         backgroundColor: Colors.deepOrange,
//         actions: [IconButton(icon: Icon(Icons.check), onPressed: () {})],
//       ),
//       // backgroundColor: Colors.black,
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
            
//             if (imageFile != null)
//               Container(
//                 child: PageView.builder(
//                     itemCount: filters.length,
//                     itemBuilder: (context, index) {
//                       return ColorFiltered(
//                           colorFilter: ColorFilter.matrix(filters[index]),
//                           child: FileImage(imageFile!)
//                           );
//                     }),
//               )
//             else
//               Center(
//                 child: Container(
             
//                   child: Text(" img not "),
//                 ),
//               ),
//             const SizedBox(
//               height: 20,
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                       onPressed: () => getImage(source: ImageSource.camera),
//                       child: const Text('Capture Image',
//                           style: TextStyle(fontSize: 18))),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Expanded(
//                   child: ElevatedButton(
//                       onPressed: () => getImage(source: ImageSource.gallery),
//                       child: const Text('Select Image',
//                           style: TextStyle(fontSize: 18))),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void getImage({required ImageSource source}) async {
//     final file = await ImagePicker().pickImage(
//         source: source,
//         maxWidth: 640,
//         maxHeight: 480,
//         imageQuality: 70 //0 - 100
//         );

//     if (file?.path != null) {
//       setState(() {
//         imageFile = File(file!.path);
//       });
//     }
//   }
// }
