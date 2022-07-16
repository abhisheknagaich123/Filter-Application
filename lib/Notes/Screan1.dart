// import 'package:flutter/material.dart';

// import 'Addnotes.dart';


// class Screen1 extends StatelessWidget {
//   const Screen1({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("TechNotes")),
//       floatingActionButton: FloatingActionButton(child: Icon(Icons.add),
//       onPressed: (){
//         Navigator.push(context, MaterialPageRoute(builder: (context){
//           return  Addnode();
//         }
//         ));
//       },),
//       body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//       itemCount: 10,
//        itemBuilder: (_,index){
//         return Container(
//           margin: EdgeInsets.all(10),
//           height: 150,
//           color: Colors.blueGrey,
//         );
//        }),
//     );
//   }
// }