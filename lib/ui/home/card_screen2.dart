// import 'package:flutter/material.dart';
// import 'package:login_screen_homework/data/network/card_repository.dart';
// import 'package:login_screen_homework/models/cards_model.dart';
// import 'package:zoom_tap_animation/zoom_tap_animation.dart';
//
//
// class CurrenciesScreen2 extends StatefulWidget {
//   const CurrenciesScreen2({Key? key}) : super(key: key);
//
//   @override
//   State<CurrenciesScreen2> createState() => _CurrenciesScreen2State();
// }
//
// class _CurrenciesScreen2State extends State<CurrenciesScreen2> {
//   final CardRepository card = CardRepository();
//   List<CardsModel> cards = [];
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Currencies Screen"),
//       ),
//       body: FutureBuilder<List<CardsModel>>(
//         future: card.getUserCards(),
//         builder: (
//             BuildContext context,
//             AsyncSnapshot<List<CardsModel>> snapshot,
//             ) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           } else if (snapshot.hasData) {
//             List<CardsModel> currencies = snapshot.data!;
//             return currencies.isNotEmpty
//                 ? ListView(
//               children: List.generate(
//                 currencies.length,
//                     (index) {
//                   CardsModel currency = currencies[index];
//                   return ZoomTapAnimation(
//                     child: Container(
//                       decoration: BoxDecoration(border: Border.all(color: Colors.black)),
//                       child: ListTile(
//                         onTap: (){},
//                         title: Padding(
//                           padding: const EdgeInsets.only(left: 40),
//                           child: Text(cardsModel.bankName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
//                         ),
//                         subtitle: Align(
//                           alignment: Alignment.centerLeft,
//                           child: Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   Align(
//                                       alignment: Alignment.centerLeft,
//                                       child: Text("ID:"+cardsModel.id.toString()+".  ",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w500),)),
//                                   Container(
//                                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.brown,),
//                                       child: Padding(
//                                         padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
//                                         child: Text(cardsModel.cardNumber,style: TextStyle(color: Colors.white,fontSize: 10),),
//                                       )),
//                                 ],
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 40),
//                                 child: Align(
//                                     alignment: Alignment.centerLeft,
//                                     child: Column(
//                                       children: [
//                                         Text(cardsModel.cardType,style: TextStyle(color: Colors.teal,fontWeight: FontWeight.w600),),
//                                       ],
//                                     )),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 40),
//                                 child: Align(
//                                     alignment: Alignment.centerLeft,
//                                     child: RichText(
//                                       text: TextSpan(
//                                         children: [
//                                           TextSpan(
//                                             text: 'Value: ',
//                                             style: TextStyle(
//                                               color: Colors.blueAccent,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                           TextSpan(
//                                               text: cardsModel.moneyAmount.toString(),
//                                               style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400)
//                                           ),
//                                           TextSpan(
//                                               text: "   "+cardsModel.cardCurrency,
//                                               style: TextStyle(color: Colors.indigo,)
//                                           ),
//                                         ],
//                                       ),
//                                     )),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 40),
//                                 child: Align(
//                                     alignment: Alignment.centerLeft,
//                                     child: Text(cardsModel.expireDate,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 10),)),
//                               ),
//                             ],
//                           ),
//                         ),
//                         trailing: Image.network(cardsModel.iconImage),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             )
//                 : const Center(child: Text("Data is empty!"));
//           }
//           return Center(child: Text("Error:${snapshot.error}"));
//         },
//       ),
//     );
//   }
// }