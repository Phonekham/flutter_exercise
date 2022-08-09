import 'package:flutter/material.dart';
import 'package:flutter_exercise/features/guessing_number/model/answer.dart';

class AnswerItem extends StatelessWidget {
  const AnswerItem({Key? key, required this.answer}) : super(key: key);
  final Answer answer;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        title: Text(
          'your guess : ${answer.inputNumber} ',
        ),
        subtitle: Text(
          'random num: ${answer.randomNumber}',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
