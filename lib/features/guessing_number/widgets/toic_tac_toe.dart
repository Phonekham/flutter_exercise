import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({Key? key}) : super(key: key);

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  final _numberController = TextEditingController();

  void _check() {
    print('| | | |');
    final int num = int.parse(_numberController.text);
    for (var i = 0; i < 5; i++) {
      print('|');
    }
  }

  void _handleChange(value) {
    print(value);
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
            TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 1,
                controller: _numberController,
                onChanged: (value) {
                  _handleChange(value);
                }),
            Center(
              child:
                  ElevatedButton(onPressed: _check, child: Text('choose size')),
            ),
          ],
        ),
      ),
    );
  }
}
