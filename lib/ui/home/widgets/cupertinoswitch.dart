// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class MySwitch extends StatefulWidget {
//   @override
//   _MySwitchState createState() => _MySwitchState();
// }
//
// class _MySwitchState extends State<MySwitch> {
//   bool switchValue = false;
//
//   void toggleSwitch(bool value) {
//     setState(() {
//       switchValue = value;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CupertinoSwitch(
//           value: switchValue,
//           activeColor: CupertinoColors.activeGreen,
//           trackColor: CupertinoColors.systemGrey,
//           onChanged: toggleSwitch,
//         ),
//         Align(
//           alignment: Alignment.centerLeft,
//           child: switchValue
//               ? Icon(Icons.female, size: 25,color: Colors.black,)
//               : Icon(Icons.male, size: 25,color: Colors.red,),
//         ),
//       ],
//     );
//   }
// }
