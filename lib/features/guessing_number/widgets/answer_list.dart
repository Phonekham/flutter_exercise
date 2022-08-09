import 'package:flutter/material.dart';
import 'package:flutter_exercise/features/guessing_number/model/answer.dart';
import 'package:flutter_exercise/features/guessing_number/widgets/answer_item.dart';

class AnswerList extends StatelessWidget {
  final List<Answer> answers;
  const AnswerList(this.answers);

  @override
  Widget build(BuildContext context) {
    return answers.isEmpty
        ? Column(
            children: const [Text('No Answer')],
          )
        : ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: answers.length,
            itemBuilder: (BuildContext context, int index) {
              return AnswerItem(
                answer: answers[index],
              );
            },
          );
  }
}
