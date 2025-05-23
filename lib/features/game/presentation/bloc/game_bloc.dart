import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordle_urvi_version/features/game/domain/game_repository.dart';
import 'package:wordle_urvi_version/features/game/presentation/bloc/game_event.dart';
import 'package:wordle_urvi_version/features/game/presentation/bloc/game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final GameRepository gameRepository;

  GameBloc({required this.gameRepository}) : super(GameState.initial()) {
    on<StartGameEvent>(_onStartGameEvent);
    on<EnterKeyEvent>(_onEnterKeyEvent);
    on<DeleteKeyEvent>(_onDeleteKeyEvent);
    on<EnterAttemptEvent>(_onEnterAttemptEvent);
  }

  Future<void> _onStartGameEvent(StartGameEvent event, Emitter<GameState> emit) async {
    emit(state.copyWith(status: GameStatus.loading));

    final result = await gameRepository.getRandomWord(event.wordLength);

    result.fold(
      (failure) {
        emit(state.copyWith(
          status: GameStatus.error,
          errorMessage: failure.message,
        ));
      },
      (word) {
        emit(state.copyWith(
          status: GameStatus.inProgress,
          word: word,
          attempts: [],
          currentAttempt: '',
          errorMessage: '',
          attemptsCount: event.attemptsCount,
        ));
      },
    );
  }

  Future<void> _onEnterKeyEvent(EnterKeyEvent event, Emitter<GameState> emit) async {
    final currentAttempt = state.currentAttempt ?? '';
    final word = state.word ?? '';

    if (word.isEmpty || currentAttempt.length >= word.length) return;

    emit(state.copyWith(
      currentAttempt: currentAttempt + event.key,
      status: GameStatus.inProgress,
    ));
  }

  Future<void> _onDeleteKeyEvent(DeleteKeyEvent event, Emitter<GameState> emit) async {
    final currentAttempt = state.currentAttempt ?? '';

    if (currentAttempt.isEmpty) return;

    emit(state.copyWith(
      currentAttempt: currentAttempt.substring(0, currentAttempt.length - 1),
      status: GameStatus.inProgress,
    ));
  }

  Future<void> _onEnterAttemptEvent(EnterAttemptEvent event, Emitter<GameState> emit) async {
    final word = state.word ?? '';
    final currentAttempt = state.currentAttempt ?? '';
    final attempts = state.attempts ?? [];

    if (word.isEmpty || currentAttempt.length < word.length) return;

    final updatedAttempts = [...attempts, currentAttempt];

    emit(state.copyWith(
      attempts: updatedAttempts,
      currentAttempt: '',
      status: GameStatus.inProgress,
    ));

    if (currentAttempt == word) {
      emit(state.copyWith(status: GameStatus.win));
    } else if (updatedAttempts.length == (state.attemptsCount ?? 0)) {
      emit(state.copyWith(status: GameStatus.loss));
    }
  }
}
