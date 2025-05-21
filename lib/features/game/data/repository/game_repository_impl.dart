import 'package:dio/dio.dart';
import 'package:wordle_urvi_version/core/failure/failure.dart';
import 'package:wordle_urvi_version/core/model/either.dart';
import 'package:wordle_urvi_version/features/game/data/datasource/game_remote_datasource.dart';
import 'package:wordle_urvi_version/features/game/domain/game_repository.dart';

class GameRepositoryImpl implements GameRepository{
  final GameRemoteDatasource gameRemoteDatasource;
  GameRepositoryImpl({required this.gameRemoteDatasource});
  
  
  @override
  Future<Either<Failure, void>> checkWord(String word)async {
    // TODO: implement checkWord
    try {
      var result = await gameRemoteDatasource.checkWord(word);
      return Right(null);//right side of either--> return void/null- meaning no error-- it is a dictionary word
    } on DioException catch (e) {
      return Left(GameFailure(message: 'Please enter a valid word'));//implememtation of abstract class failure that LEFT side returns
      
    }catch(e)
    {
      return Left(GameFailure(message: 'Please enter a valid word'));
    }
  }
  @override
  Future<Either<Failure, String>> getRandomWord(int length) async {
    try{
      var result = await gameRemoteDatasource.getRandomWord(length);
      return Right(result);
    } on DioException catch (e) {
      return Left(GameFailure(message: 'Please enter a valid word'));
    }
    catch(e)
  {
    return Left(GameFailure(message: 'Please enter a valid word'));

  }
  }
  //1st check if the word is valid or not
  //2nd pass word to the api
}