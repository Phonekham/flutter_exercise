import 'package:flutter/material.dart';
import 'dart:math' show Random;

import 'package:flutter_exercise/features/widgets/drawer.dart';

class GuessNumber extends StatefulWidget {
  const GuessNumber({Key? key}) : super(key: key);

  @override
  State<GuessNumber> createState() => _GuessNumberState();
}

class _GuessNumberState extends State<GuessNumber> {
  final _numberController = TextEditingController();
  int count = 0;
  bool start = false;
  bool game_over = false;
  late int rnd = 0;

  void _randomNumber() {
    var MAX = 100;
    var randomizer = Random();
    var num = randomizer.nextInt(MAX);
    setState(() {
      rnd = num;
    });
  }

  void _check() {
    final answer = int.parse(_numberController.text);
    if (answer < rnd) {
      print("too low");
    } else if (answer > rnd) {
      print('too hight');
    } else {
      print('correct');
      setState(() {
        game_over = true;
      });
    }
    setState(() {
      count++;
    });
    print(count);
  }

  void _startGame() {
    setState(() {
      start = true;
      game_over = false;
      count = 0;
    });
    _randomNumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guessing Number App'),
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              maxLength: 3,
              controller: _numberController,
            ),
            game_over
                ? Center(
                    child: ElevatedButton(
                        onPressed: _startGame, child: const Text('Start')),
                  )
                : Center(
                    child: start
                        ? ElevatedButton(
                            onPressed: _check, child: const Text('Guess'))
                        : ElevatedButton(
                            onPressed: _startGame, child: const Text('Start')),
                  ),
            game_over
                ? Center(
                    child: Text(
                        'you choose correct number your attemp is $count times'),
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
