import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/data/network/card_repository.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import '../../models/cards_model.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  late CardRepository cardRepository;
  List<CardsModel> cards = [];
  bool isLoading = false;


  @override
  void initState() {
    super.initState();
    cardRepository = CardRepository();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    try {
      cards = await cardRepository.getUserCards();
      print("Fetched ${cards.length} cards");
    } catch (e) {
      print("Error fetching cards: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text("Data of Card"),
      ),
      body: isLoading
          ? Center(
        child: CupertinoActivityIndicator(),
      )
          : cards.isEmpty
          ? Center(child: Text("Data is empty!"))
          : ListView.builder(
        itemCount: cards.length,
        itemBuilder: (context, index) {
          CardsModel cardsModel = cards[index];
          String colorA =
              "0xFF${cardsModel.colors["color_a"].toString().substring(1)}";
          String colorB =
              "0xFF${cardsModel.colors["color_b"].toString().substring(1)}";
          return ZoomTapAnimation(
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black),
                  gradient: LinearGradient(colors: [
                    Color(int.parse(colorA)),
                    Color(int.parse(colorB))
                  ]),
              ),
              child: ListTile(
                onTap: (){},
                title: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Text(cardsModel.bankName,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white),),
                ),
                subtitle: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                              child: Text("ID:"+cardsModel.id.toString()+".  ",style: TextStyle(color: Colors.tealAccent,fontWeight: FontWeight.w500),)),
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                                child: Text(cardsModel.cardNumber,style: TextStyle(color: Colors.black,fontSize: 10),),
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Align(
                          alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Text(cardsModel.cardType,style: TextStyle(color: Colors.teal,fontWeight: FontWeight.w600),),
                              ],
                            )),
                      ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Align(
                      alignment: Alignment.centerLeft,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Value: ',
                                style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: cardsModel.moneyAmount.toString(),
                                style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400)
                              ),
                              TextSpan(
                                text: "   "+cardsModel.cardCurrency,
                                style: TextStyle(color: Colors.indigo,)
                              ),
                            ],
                          ),
                        ),
                    ),
                    ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Align(
                          alignment: Alignment.centerLeft,
                            child: Text(cardsModel.expireDate,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 10),)),
                      ),
                    ],
                  ),
                ),
                trailing: Image.network(cardsModel.iconImage),
              ),
            ),
          );
        },
      ),
    );
  }
}


