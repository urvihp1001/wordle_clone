import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  final int attemptsCount;
  final int wordLength;

  const GamePage(
      {super.key, required this.attemptsCount, required this.wordLength});

  static String route({required int wordLength, required int attemptsCount}) =>
      Uri(path: '/game', queryParameters: {
        'attemptsCount': attemptsCount.toString(),
        'wordLength': wordLength.toString()
      }).toString();
       @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}