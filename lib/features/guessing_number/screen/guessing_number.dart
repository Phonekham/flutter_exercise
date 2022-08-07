import 'package:flutter/material.dart';
import 'dart:math' show Random;
import 'dart:io';

class GuessingNumber extends StatefulWidget {
  const GuessingNumber({Key? key}) : super(key: key);

  @override
  State<GuessingNumber> createState() => _GuessingNumberState();
}

class _GuessingNumberState extends State<GuessingNumber> {
  int count = 0;
  int cows = 0;
  int bulls = 0;
  bool game_over = false;
  final _numberController = TextEditingController();

  int _randomNumber() {
    var MAX = 9;
    var randomizer = Random();
    var num = randomizer.nextInt(MAX);
    return num;
  }

  String _computeNumber() {
    final fisrt = _randomNumber();
    final second = _randomNumber();
    final third = _randomNumber();
    final fourth = _randomNumber();
    var rnd = fisrt.toString() +
        second.toString() +
        third.toString() +
        fourth.toString();
    return rnd;
  }

  bool? _verifyEntryNumber(number) {
    number = number.toString();
    bool verify = true;
    for (var i = 0; i < 4; i++) {
      if (number.lastIndexOf) {}
    }
  }

  void _check() {
    if (_numberController.text.length < 4) {
      return;
    }
    final rnd = _computeNumber();
    final rnd1 = rnd[0];
    final rnd2 = rnd[1];
    final rnd3 = rnd[2];
    final rnd4 = rnd[3];
    final input1 = _numberController.text[0];
    final input2 = _numberController.text[1];
    final input3 = _numberController.text[2];
    final input4 = _numberController.text[3];
    if (rnd1 == input1) {
      setState(() {
        cows++;
      });
    } else if (input1 == rnd2 || input1 == rnd3 || input1 == input4) {
      setState(() {
        bulls++;
      });
    }

    if (rnd2 == input2) {
      setState(() {
        cows++;
      });
    } else if (input2 == rnd1 || input2 == rnd3 || input2 == input4) {
      setState(() {
        bulls++;
      });
    }

    if (rnd3 == input3) {
      setState(() {
        cows++;
      });
    } else if (input3 == rnd1 || input3 == rnd2 || input3 == input4) {
      setState(() {
        bulls++;
      });
    }

    if (rnd4 == input4) {
      setState(() {
        cows++;
      });
    } else if (input4 == rnd1 || input4 == rnd2 || input4 == input3) {
      setState(() {
        bulls++;
      });
    }

    print(rnd);
    print(_numberController.text);
    print(cows);
    print(bulls);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Guessing Number App'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                'Guese number',
                style: TextStyle(fontSize: 25),
              )),
            ),
            Padding(
              padding: EdgeInsets.only(right: 30.0, left: 30),
              child: TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 4,
                controller: _numberController,
                // onChanged: (value) {
                //   print(value);
                // }
              ),
            ),
            Center(
              child: ElevatedButton(onPressed: _check, child: Text('Guess')),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('Your score'),
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'cows: ${cows}',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    'bulls: ${bulls}',
                    style: TextStyle(fontSize: 25),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
