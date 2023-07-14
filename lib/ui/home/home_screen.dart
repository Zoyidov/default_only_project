import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_screen_homework/utils/images.dart';
import '../../data/network/provider/pokemon_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pokemonData;
  PokemonApiProvider apiProvider = PokemonApiProvider();

  _init() async {
    print(await apiProvider.getPokemon());
    pokemonData = await apiProvider.getPokemon();
    setState(() {});
    print(pokemonData);
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (pokemonData == null) {
      return Scaffold(
        backgroundColor: const Color(0xFFFC7CFF),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 300),
              const Text(
                "Loading",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 50),
              const CupertinoActivityIndicator(
                color: Colors.white,
                radius: 25,
              ),
            ],
          ),
        ),
      );
    } else  {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(
              height: 60,
            ),
            Center(
              child: Image.asset(
                AppImages.pokemon,
                width: 252,
                height: 88,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 296,
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFFE5E5E5),
              ),
              child: Center(
                child: Text(
                  "Buscar Pokémon",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF838282),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: pokemonData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          height: 117,
                          width: 177,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFFFC7CFF),
                          ),
                          child: Stack(
                            children: [
                              Padding(
                                padding:
                                EdgeInsets.only(top: 80, left: 15, right: 15),
                                child: Container(
                                  height: 27,
                                  width: 147,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF676767),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: -58,
                        child: SizedBox(
                          height: 200,
                          child: CachedNetworkImage(
                            imageUrl: pokemonData[index].img,
                            placeholder: (context, url) =>
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 85),
                                  child: Center(
                                    child: CupertinoActivityIndicator(
                                      color: Colors.black,
                                      radius: 15,
                                    ),
                                  ),
                                ),
                            errorWidget: (context, url, error) =>
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 85),
                                  child: Center(child: Icon(Icons.error)),
                                ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
  }
}