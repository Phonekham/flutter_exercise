import 'package:flutter/material.dart';
import 'package:flutter_exercise/features/guess_number/guess_number.dart';
import 'package:flutter_exercise/features/guessing_number/screen/guessing_number.dart';
import 'package:flutter_exercise/features/hangman/hangman_word.dart';
import 'package:flutter_exercise/features/hangman/screen/hangman.dart';
import 'package:flutter_exercise/features/hangman/screen/hangman2.dart';
import 'package:flutter_exercise/features/max/max.dart';

class CustomDrawer extends StatefulWidget {
  final HangmanWords hangmanWords = HangmanWords();

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: const Text('Ex 16 cows & bulls'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const GuessingNumber()));
            },
          ),
          ListTile(
            title: const Text('Ex 17 Tic Tac Toe 1'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const GuessingNumber()));
            },
          ),
          ListTile(
            title: const Text('Ex 18 Tic Tac Toe 2'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const GuessingNumber()));
            },
          ),
          ListTile(
            title: const Text('Ex 19 Tic Tac Toe 3'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const GuessingNumber()));
            },
          ),
          ListTile(
            title: const Text('Ex 20 Tic Tac Toe 4'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const GuessingNumber()));
            },
          ),
          ListTile(
            title: const Text('Ex 21 guess number'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const GuessNumber()));
            },
          ),
          ListTile(
            title: const Text('Ex 22 max'),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const MaxInput()));
            },
          ),
          ListTile(
            title: const Text('Ex 23 sowpods'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const GuessingNumber()));
            },
          ),
          ListTile(
            title: const Text('Ex 24 hangman 1'),
            onTap: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => const Hangman()));
            },
          ),
          ListTile(
            title: const Text('Ex 25 hangman 2'),
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Hangman2(hangmanObject: widget.hangmanWords)));
            },
          ),
          ListTile(
            title: const Text('Ex 26 birthday'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const GuessingNumber()));
            },
          ),
          ListTile(
            title: const Text('Ex 27 birthday2'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const GuessingNumber()));
            },
          ),
          ListTile(
            title: const Text('Ex 28 birthday3'),
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => const GuessingNumber()));
            },
          ),
        ],
      ),
    );
  }
}
