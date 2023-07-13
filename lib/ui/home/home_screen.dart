import 'package:flutter/material.dart';
import 'package:login_screen_homework/utils/images.dart';
import '../../data/models/pokemon_model.dart';
import '../../data/network/provider/pokemon_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PokemonApiProvider _pokemonApiProvider = PokemonApiProvider();
  late Future<Pokemon> _pokemonFuture;

  @override
  void initState() {
    super.initState();
    _pokemonFuture = _pokemonApiProvider.fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 73, vertical: 31),
              child: Image.asset(AppImages.pokemon),
            ),
            Container(
              height: 42,
              width: 296,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFFE5E5E5),
              ),
              child: Center(child: Text("Buscar Pokémon")),
            ),
            Expanded(
              child: FutureBuilder<Pokemon>(
                future: _pokemonFuture,
                builder: (BuildContext context, AsyncSnapshot<Pokemon> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Failed to fetch Pokemon'));
                  } else if (snapshot.hasData) {
                    final pokemon = snapshot.data!;
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: 115,
                                width: 177,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Color(0xFFFC7CFF),
                                ),
                              ),
                            ),
                            Positioned(
                              top: -16,
                              left: 46,
                              child: SizedBox(
                                height: 108,
                                width: 117,
                                child: Image.network(
                                  // Provide the image URL or path here
                                  'https://example.com/pokemon-image.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return Center(child: Text('No Pokemon data available'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
