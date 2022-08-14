import 'package:flutter/material.dart';

class WordButton extends StatelessWidget {
  WordButton({required this.buttonTitle, required this.onPress});

  final VoidCallback? onPress;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(
        buttonTitle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
