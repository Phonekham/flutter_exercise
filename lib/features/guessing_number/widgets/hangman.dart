import 'package:flutter/material.dart';

class Hangman extends StatefulWidget {
  const Hangman({Key? key}) : super(key: key);

  @override
  State<Hangman> createState() => _HangmanState();
}

class _HangmanState extends State<Hangman> {
  final guess = TextEditingController();
  bool game_over = false;
  final List<String> correctWords = [];
  String puzzle = 'phonekham';

  void check(value) {
    for (var i = 0; i < puzzle.length + 1; i++) {
      if (puzzle.contains(value)) {
        print('ttt');
      }
    }
    // if(value.contains(puzzle)){
    //   print(object)
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guessing Number App'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              maxLength: 3,
              controller: guess,
              onChanged: (value) {
                check(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
