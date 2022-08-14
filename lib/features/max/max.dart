import 'package:flutter/material.dart';
import 'package:flutter_exercise/features/widgets/drawer.dart';

class MaxInput extends StatefulWidget {
  const MaxInput({Key? key}) : super(key: key);

  @override
  State<MaxInput> createState() => _MaxInputState();
}

class _MaxInputState extends State<MaxInput> {
  final _input1 = TextEditingController();
  final _input2 = TextEditingController();
  final _input3 = TextEditingController();
  int maxInput = 0;

  void _check() {
    final num1 = int.parse(_input1.text);
    final num2 = int.parse(_input2.text);
    final num3 = int.parse(_input3.text);
    if (num1 > num2) {
      if (num1 > num3) {
        setState(() {
          maxInput = num1;
        });
      } else {
        setState(() {
          maxInput = num3;
        });
      }
    } else {
      if (num2 > num3) {
        setState(() {
          maxInput = num2;
        });
      } else {
        setState(() {
          maxInput = num3;
        });
      }
    }
    print(maxInput);
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
              controller: _input1,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              maxLength: 3,
              controller: _input2,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              maxLength: 3,
              controller: _input3,
            ),
            Center(
              child: ElevatedButton(onPressed: _check, child: const Text('ok')),
            ),
            Center(
              child: Text('max number is $maxInput'),
            )
          ],
        ),
      ),
    );
  }
}
