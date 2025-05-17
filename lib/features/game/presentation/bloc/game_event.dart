abstract class GameEvent {
 
}

class StartGameEvent extends GameEvent {
  final int attemptsCount;
  final int wordLength;
  StartGameEvent({
    required this.attemptsCount,
    required this.wordLength,
  });
}