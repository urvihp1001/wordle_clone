import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle_urvi_version/features/game/presentation/bloc/game_bloc.dart';
import 'package:wordle_urvi_version/features/game/presentation/bloc/game_state.dart'; 
import 'package:wordle_urvi_version/features/game/presentation/widgets/attempt_row.dart';

class AttemptWidget extends StatelessWidget {
  const AttemptWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        return Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return AttemptRow(
                  attemptIndex: index,
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 10);
              },
              itemCount: state.attemptsCount ?? 0,
              shrinkWrap: true,
            ),
          ),
        );
      },
    );
  }
}
