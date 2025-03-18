import '../models/character.dart';
import 'package:flutter/material.dart';

class DescriptionScreen extends StatefulWidget {
  final Character character;

  const DescriptionScreen(this.character, {super.key});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    final character = widget.character;
      return Scaffold(
        appBar: AppBar(
          title: Text(character.name),
          centerTitle: true,
        ),
        body: Card(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Gender: ${character.gender}",
                  style: const TextStyle(fontSize: 20)),
                  Text("Heigth: ${character.height}", 
                  style: const TextStyle(fontSize: 20)),
                  Text("Mass: ${character.mass}", 
                  style: const TextStyle(fontSize: 20)),
                ],
              )
            ],
          ),
        ),
      );
  }
}