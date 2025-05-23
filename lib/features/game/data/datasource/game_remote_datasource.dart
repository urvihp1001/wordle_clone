import 'package:dio/dio.dart';
class GameRemoteDatasource{
  final Dio dio;
  GameRemoteDatasource({required this.dio});
 Future<String> getRandomWord(int wordLength) async {
  try {
    final response = await dio.get(
      'https://random-word-api.herokuapp.com/word',
      queryParameters: {
        'number': 1,
        'length': wordLength,
       
      },
    );

    if (response.statusCode == 200 && response.data is List && response.data.isNotEmpty) {
      return (response.data[0]as String).toUpperCase();
    } else {
      throw Exception('Failed to load random word');
    }
  } catch (e) {
    throw Exception('Failed to load random word: $e');
  }
}

Future<void> checkWord(String word) async {
    try {
      final response = await dio.get('https://api.dictionaryapi.dev/api/v2/entries/en/$word');
      if (response.statusCode != 200) {
        throw Exception('Failed to check word');
      }
    } catch (e) {
      throw Exception('Failed to check word: $e');
    }
  }
}