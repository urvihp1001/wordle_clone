import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle_urvi_version/core/get_it/get_it.dart';
import 'package:wordle_urvi_version/features/game/presentation/bloc/game_bloc.dart';
import 'package:wordle_urvi_version/features/game/presentation/bloc/game_event.dart';
import 'package:wordle_urvi_version/features/game/presentation/bloc/game_state.dart';
import 'package:wordle_urvi_version/features/game/presentation/widgets/attempt_widget.dart';
import 'package:wordle_urvi_version/features/game/presentation/widgets/game_keyboard.dart';
import 'package:wordle_urvi_version/features/game/presentation/widgets/lossDialog.dart';
import 'package:wordle_urvi_version/features/game/presentation/widgets/winDialog.dart';

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
        child: BlocConsumer<GameBloc,GameState>(
          builder: (context,state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Game'),
              ),
              body:Column(children: [
                SizedBox(
                  height: 20,
                ),
                   AttemptWidget(),
                   Spacer(),
                   GameKeyboard(onKeyPressed: (v){
              context.read<GameBloc>().add(EnterKeyEvent(key: v));
                   },
                   onDelete: (){
                      context.read<GameBloc>().add(DeleteKeyEvent());
                   },
                   onSubmit: (){
                      context.read<GameBloc>().add(EnterAttemptEvent());
                   },
                   )
              ],)
            );
          },
          listener: (context,state){
            if(state.status==GameStatus.win){
              showDialog(context: context, builder: (context){
                return Windialog(word: state.word??'');
              },barrierDismissible: false);//when user clicks outside the dialog, it will not close
            }
            if(state.status==GameStatus.loss){
              showDialog(context: context, builder: (context){
                return Lossdialog(word: state.word??'');
              },barrierDismissible: false);//when user clicks outside the dialog, it will not close
            } 
            //until i register in gamebloc it wont emit status as loss so wont show dialog
          },
        ),
      
    );
  }
}