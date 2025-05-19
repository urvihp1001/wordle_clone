import 'package:wordle_urvi_version/features/game/presentation/bloc/game_event.dart';
import 'package:wordle_urvi_version/features/game/presentation/bloc/game_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class GameBloc extends Bloc<GameEvent, GameState> {
 GameBloc() : super(GameState.initial()) {
    on<StartGameEvent>(onStartGameEvent);
    on<EnterKeyEvent>(onEnterKeyEvent);
  }
  Future<void> onStartGameEvent(
      StartGameEvent event, Emitter<GameState> emit) async {
    emit(state.copyWith(
      status: GameStatus.inProgress,
      word:'TEST',
     
      attemptsCount: event.attemptsCount,
    ));
  }
  Future<void> onEnterKeyEvent(
      EnterKeyEvent event, Emitter<GameState> emit) async {
    var currentAttempt = state.currentAttempt ?? '';
    var word=state.word??'';
  if(word.isEmpty){
    return;
  }
  if(currentAttempt.length>=word.length){
    return;
  }
  emit(state.copyWith(
    currentAttempt: currentAttempt+event.key,
    status: GameStatus.inProgress,
  ));
      }
}