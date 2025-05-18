import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle_urvi_version/core/get_it/get_it.dart';
import 'package:wordle_urvi_version/features/game/presentation/bloc/game_bloc.dart';
import 'package:wordle_urvi_version/features/game/presentation/bloc/game_event.dart';
import 'package:wordle_urvi_version/features/game/presentation/widgets/attempt_widget.dart';

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
    return BlocProvider(
      create: (context) => getIt<GameBloc>()
       ..add(StartGameEvent(
            attemptsCount: attemptsCount, wordLength: wordLength)),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Game'),
          ),
          body:Column(children: [
            SizedBox(
              height: 20,
            ),
       AttemptWidget()
          ],)
        ),
      
    );
  }
}