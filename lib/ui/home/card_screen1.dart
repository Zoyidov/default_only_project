import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/data/network/card_repository.dart';
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
      // Handle the error, show an error message, etc.
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
          return ListTile(
            title: Row(
              children: [
                Text(cardsModel.id),
                Text(cardsModel.bankName),
              ],
            ),
            subtitle: Column(
              children: [
                Text(cardsModel.cardNumber),
                Text(cardsModel.cardType),
              ],
            ),
            trailing: Text(cardsModel.cardCurrency),
          );
        },
      ),
    );
  }
}
