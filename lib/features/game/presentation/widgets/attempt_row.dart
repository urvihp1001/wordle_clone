import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle_urvi_version/core/theme/app_colors.dart';
import 'package:wordle_urvi_version/features/game/presentation/bloc/game_bloc.dart';
import 'package:wordle_urvi_version/features/game/presentation/bloc/game_state.dart';
import 'package:wordle_urvi_version/features/game/presentation/widgets/letter_box_widget.dart';

class AttemptRow extends StatelessWidget {
  final int attemptIndex;
  const AttemptRow({super.key, required this.attemptIndex});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc,GameState>(
      builder: (context,state) {
        final word=state.word??'';
        final previousAttempts=state.attempts??[];
        final currentAttempt=state.currentAttempt??'';
        final isCurrentAttempt=attemptIndex==previousAttempts.length;
        return Row(
          children: List.generate(
           word.length,
            (letterIndex) {
              var text= _getLetter(letterIndex, attemptIndex, previousAttempts, currentAttempt, isCurrentAttempt);
              var boxColor=getBoxColor(context, text, word, attemptIndex, letterIndex, previousAttempts, isCurrentAttempt);
              var textColor=getTextColor(context, text, word, attemptIndex, letterIndex, previousAttempts, isCurrentAttempt);
              return Expanded(child:
                LetterBoxWidget(
                  text: text,
                  boxColor: boxColor,
                  textColor: textColor,
                )
              );
            }
          ),
          
        );
      }
    );
  }
  //add correct letter/space to the letter box
  String _getLetter(int letterIndex, int attemptIndex, List<String> previousAttempts, String currentAttempt, bool isCurrentAttempt) {
    if (attemptIndex < previousAttempts.length) {
      return previousAttempts[attemptIndex][letterIndex];
    } else if (isCurrentAttempt) {
      if (letterIndex < currentAttempt.length) {
        return currentAttempt[letterIndex];
      } else {
        return '';
      }
    } else {
      return '';
    }
  
  }
  //add correct color to the letter box
  Color? getBoxColor(BuildContext context, String letter, String word, int attemptIndex, int letterIndex, List<String> previousAttempts, bool isCurrentAttempt) {
if(attemptIndex>=previousAttempts.length||letter.isEmpty || isCurrentAttempt){ //adding lettters to middle of the word or empty or next position
  return null;
}
else if (word[letterIndex] == letter) { //correct letter
  return AppColors.green;
  }
else if (word.contains(letter)) { //present letter
  return AppColors.yellow;
  }
  return Theme.of(context).colorScheme.onSurfaceVariant; //not present letter
  }

    Color? getTextColor(BuildContext context, String letter, String word, int attemptIndex, int letterIndex, List<String> previousAttempts, bool isCurrentAttempt) {
if(attemptIndex>=previousAttempts.length||letter.isEmpty || isCurrentAttempt){ //adding lettters to middle of the word or empty or next position
  return Theme.of(context).colorScheme.onSurface;
  
}
else if (word[letterIndex] == letter || word.contains(letter)) { 
  return Theme.of(context).colorScheme.surface;
  }
  return Theme.of(context).colorScheme.onSurface; //not present letter
  }

}