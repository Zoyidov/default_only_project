// import 'dart:js_interop';
//
// import 'package:flutter/material.dart';
//
// class CustomSearchDelegate extends SearchDelegate<String> {
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: Icon(Icons.clear,color: Colors.black,),
//         onPressed: () {
//           if (buildResults.isUndefined){
//             close(context, '');
//           }
//           query = '';
//         },
//       ),
//     ];
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
//       onPressed: () {
//         close(context, '');
//       },
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     return Container(
//       child: Text('Search Results for: $query'),
//     );
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return Container(
//       child: Text(''),
//     );
//   }
// }