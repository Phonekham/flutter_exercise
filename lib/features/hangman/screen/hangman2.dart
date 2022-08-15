import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:flutter_exercise/features/hangman/widgets/word_button.dart';
import 'package:flutter_exercise/features/widgets/drawer.dart';

import '../hangman_word.dart';

class Alphabet {
  String alphabet = 'abcdefghijklmnopqrstuvwxyz';
}

class Hangman2 extends StatefulWidget {
  const Hangman2({required this.hangmanObject});

  final HangmanWords hangmanObject;

  @override
  State<Hangman2> createState() => _Hangman2State();
}

class _Hangman2State extends State<Hangman2> {
  // Init state
  late String word;
  List<String> wordList = [];
  late List<bool> buttonStatus;
  late String hiddenWord;
  bool finishedGame = false;
  int wordCount = 0;
  int hangState = 0;
  int guessRemain = 6;
  Alphabet englishAlphabet = Alphabet();

  String getHiddenWord(int wordLength) {
    String hiddenWord = '';
    for (int i = 0; i < wordLength; i++) {
      hiddenWord += '_';
    }
    return hiddenWord;
  }

  void initWords() {
    word = widget.hangmanObject.getWord();
    wordList = [];
    hangState = 0;
    guessRemain = 6;

    buttonStatus = List.generate(26, (index) => true);
    if (word.isNotEmpty) {
      hiddenWord = getHiddenWord(word.length);
    }
    for (var i = 0; i < word.length; i++) {
      wordList.add(word[i]);
    }
  }

  void newGame() {
    setState(() {
      widget.hangmanObject.resetWords();
      englishAlphabet = Alphabet();
      wordCount = 0;
      finishedGame = false;
      initWords();
    });
  }

  Widget createButton(int? index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 3.5, vertical: 6.0),
      child: Center(
        child: index != null
            ? WordButton(
                buttonTitle: englishAlphabet.alphabet[index].toUpperCase(),
                onPress:
                    buttonStatus[index] ? () => onPressButton(index) : null,
              )
            : null,
      ),
    );
  }

// onpress the word
  void onPressButton(int index) {
    bool isCorrect = false;
    setState(() {
      for (var i = 0; i < wordList.length; i++) {
        // if correct
        if (wordList[i] == englishAlphabet.alphabet[index]) {
          isCorrect = true;
          wordList[i] = '';
          hiddenWord = hiddenWord.replaceFirst(RegExp('_'), word[i], i);
          buttonStatus[index] = false;
        }
      }

      if (!isCorrect) {
        hangState++;
        guessRemain--;
      }
      if (hangState == 6) {
        finishedGame = true;
        Alert(
            style: AlertStyle(
              animationType: AnimationType.grow,
              isCloseButton: false,
              isOverlayTapDismiss: false,
              animationDuration: const Duration(milliseconds: 450),
              backgroundColor: const Color(0xFF2C1E68),
              alertBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              titleStyle: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                letterSpacing: 1.5,
              ),
              descStyle: const TextStyle(
                color: Colors.lightBlue,
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                letterSpacing: 1.5,
              ),
            ),
            context: context,
            title: "Game Over!",
            buttons: [
              DialogButton(
                onPressed: () {
                  newGame();
                  Navigator.pop(context);
                },
                child: const Text(
                  'Reset',
                  style: TextStyle(color: Colors.white),
                ),
                color: const Color(0x00000000),
              ),
            ]).show();
      }

      // finished game if  user guessed all word
      if (hiddenWord == word) {
        finishedGame = true;
        Alert(
          context: context,
          style: AlertStyle(
            animationType: AnimationType.grow,
            isCloseButton: false,
            isOverlayTapDismiss: false,
            animationDuration: const Duration(milliseconds: 500),
            backgroundColor: const Color(0xFF2C1E68),
            alertBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            titleStyle: const TextStyle(
              color: Color(0xFF00e676),
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
              letterSpacing: 1.5,
            ),
          ),
          type: AlertType.success,
          title: word,
//          desc: "You guessed it right!",
          buttons: [
            DialogButton(
              radius: BorderRadius.circular(10),
              child: const Text(
                'Game finsihed ',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  wordCount += 1;
                  Navigator.pop(context);
                  initWords();
                });
              },
              width: 127,
              color: const Color(0x00000000),
              height: 52,
            )
          ],
        ).show();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initWords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hangman 1'),
      ),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 35.0),
                    alignment: Alignment.center,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        hiddenWord,
                        style: const TextStyle(
                            fontSize: 57,
                            color: Colors.blue,
                            fontFamily: 'FiraMono',
                            letterSpacing: 8),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Guess remain ${guessRemain.toString()}',
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.blue,
                        fontFamily: 'FiraMono',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(color: Colors.grey),
                    alignment: Alignment.bottomCenter,
                    child: FittedBox(
                      child: Image.asset(
                        'images/$hangState.png',
                        height: 1001,
                        width: 991,
                        gaplessPlayback: true,
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            )),
            Container(
              padding: const EdgeInsets.fromLTRB(10.0, 2.0, 8.0, 10.0),
              child: Table(
                defaultVerticalAlignment: TableCellVerticalAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  TableRow(children: [
                    TableCell(child: createButton(0)),
                    TableCell(child: createButton(1)),
                    TableCell(child: createButton(2)),
                    TableCell(child: createButton(3)),
                    TableCell(child: createButton(4)),
                    TableCell(child: createButton(5)),
                    TableCell(child: createButton(6)),
                  ]),
                  TableRow(children: [
                    TableCell(child: createButton(7)),
                    TableCell(child: createButton(8)),
                    TableCell(child: createButton(9)),
                    TableCell(child: createButton(10)),
                    TableCell(child: createButton(11)),
                    TableCell(child: createButton(12)),
                    TableCell(child: createButton(13)),
                  ]),
                  TableRow(children: [
                    TableCell(child: createButton(14)),
                    TableCell(child: createButton(15)),
                    TableCell(child: createButton(16)),
                    TableCell(child: createButton(17)),
                    TableCell(child: createButton(18)),
                    TableCell(child: createButton(19)),
                    TableCell(child: createButton(20)),
                  ]),
                  TableRow(children: [
                    TableCell(child: createButton(21)),
                    TableCell(child: createButton(22)),
                    TableCell(child: createButton(23)),
                    TableCell(child: createButton(24)),
                    TableCell(child: createButton(25)),
                    TableCell(child: createButton(null)),
                    TableCell(child: createButton(null)),
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
