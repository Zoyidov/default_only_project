import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_homework/ui/home/widgets/search_deligate.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

import '../data/network/api_provider.dart';
import '../data/network/api_repository.dart';
import '../model/currency_model.dart';
import 'about_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CurrencyRepository currencyRepository =
  CurrencyRepository(apiProvider: ApiProvider());

  List<String> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ZoomTapAnimation(
              onTap: (){
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
                child: Icon(CupertinoIcons.search,color: Colors.black,)),
          ),
        ],
        title: const Text("Home Page",style: TextStyle(color: Colors.black),),
      ),
      body: FutureBuilder<List<CurrencyModel>>(
        future: currencyRepository.fetchCurrencies(),
        builder: (
            BuildContext context,
            AsyncSnapshot<List<CurrencyModel>> snapshot,
            ) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          } else if (snapshot.hasData) {
            List<CurrencyModel> currencies = snapshot.data!;
            images = currencies.map((currency) => currency.thumbnail).toList();
            return currencies.isNotEmpty
                ? Column(
              children: [
                Container(
                  color: Colors.yellow,
                  child: SizedBox(
                    height: 250,
                    width: 400,
                    child: CarouselSlider(
                      items: images.map((url) {
                        return ZoomTapAnimation(
                          child: Container(
                            margin: const EdgeInsets.all(6.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(url),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 250,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 3),
                        autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: currencies.length,
                    itemBuilder: (context, index) {
                      CurrencyModel currency = currencies[index];
                      return ListTile(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutScreen(
                                currency: currency,
                              ),
                            ),
                          );
                        },
                        title: Text(currency.title),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(currency.title),
                          ],
                        ),
                        trailing: const Icon(Icons.arrow_right),
                      );
                    },
                  ),
                ),
              ],
            )
                : const Center(child: Text("Error occurred"));
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else {
            return const Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}
