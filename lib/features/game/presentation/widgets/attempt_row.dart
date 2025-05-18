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
           4,
            (letterIndex) {
              return Expanded(child:
                LetterBoxWidget(
                  text: 'U',
                  boxColor: AppColors.green,
                  textColor: AppColors.surface
                )
              );
            }
          ),
          
        );
      }
    );
  }
}