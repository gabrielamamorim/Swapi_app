import 'package:flutter/material.dart';
import '../services/swapi_api_service.dart';
import '../models/character.dart';
import 'character_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Character>> _futureCharacters;
  final SwapiApiService _swapiApiService = SwapiApiService();

  @override
  void initState() {
    super.initState();
    _futureCharacters = _swapiApiService.fetchCharacters();
  }

  String getCharacterImageUrl(int index) {
    return 'https://starwars-visualguide.com/assets/img/characters/${index + 1}.jpg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'The Star Wars Characters',
          style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 50),
        ),
        centerTitle: true,
        backgroundColor: Colors.black, // Cor para combinar com Star Wars
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black,
              Colors.grey,
            ], // Ajustado para garantir contraste
          ),
        ),
        child: FutureBuilder<List<Character>>(
          future: _futureCharacters,
          builder: (context, snapshot) {

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao carregar os dados: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Nenhum personagem encontrado'));
            }

            final characters = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    onTap: () {
                      print("Clicou no personagem: ${character.name}");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => CharacterDetailScreen(
                                character: character,
                                imageUrl: getCharacterImageUrl(index),
                              ),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        getCharacterImageUrl(index),
                      ),
                      backgroundColor:
                          Colors.grey[300], // Evita fundo transparente
                    ),
                    title: Text(
                      character.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Gender: ${character.gender}'),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
