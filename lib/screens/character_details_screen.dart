import 'package:flutter/material.dart';
import '../models/character.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;
  final String imageUrl;

  const CharacterDetailScreen({
    Key? key,
    required this.character,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
        centerTitle: true,
        backgroundColor: Colors.white, 
              ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.indigo.shade900, Colors.deepPurple.shade900],
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              character.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Text("Altura: ${character.height} cm"),
            Text("Peso: ${character.mass} kg"),
            Text("Gênero: ${character.gender}"),
            Text("Ano de nascimento: ${character.birth_year}"),
          ],
        ),
      ),
    );
  }
}