import 'package:wordle_urvi_version/features/game/presentation/bloc/game_event.dart';
import 'package:wordle_urvi_version/features/game/presentation/bloc/game_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class GameBloc extends Bloc<GameEvent, GameState> {
 GameBloc() : super(GameState.initial()) {
    on<StartGameEvent>(onStartGameEvent);
    on<EnterKeyEvent>(onEnterKeyEvent);
    on<DeleteKeyEvent>(onDeleteKeyEvent);
    on<EnterAttemptEvent>(onEnterAttemptEvent);
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
    currentAttempt: currentAttempt+event.key, //displaying current attempt and the key pressed
    status: GameStatus.inProgress,
  ));

      }
  Future<void> onDeleteKeyEvent(
      DeleteKeyEvent event, Emitter<GameState> emit) async {
    var currentAttempt = state.currentAttempt ?? '';
    if (currentAttempt.isEmpty) {
      return;
    }
    emit(state.copyWith(
      currentAttempt: currentAttempt.substring(0, currentAttempt.length - 1),
      status: GameStatus.inProgress,
    ));
  }

  Future<void> onEnterAttemptEvent(
    EnterAttemptEvent event, Emitter<GameState> emit) async {
            var word=state.word??'';
            var currentAttempt = state.currentAttempt ?? '';
            var attempts=state.attempts??[];
        if(word.isEmpty || currentAttempt.length<word.length){
          return;
        }
        emit(state.copyWith(
          attempts: [...attempts, currentAttempt], //adding the current attempt to the attempts list
          status: GameStatus.inProgress,
            currentAttempt: '',
        ));

  }
  
}