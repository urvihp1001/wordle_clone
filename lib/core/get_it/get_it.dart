import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:wordle_urvi_version/core/api/dio_client.dart';
import 'package:wordle_urvi_version/features/game/data/datasource/game_remote_datasource.dart';
import 'package:wordle_urvi_version/features/game/data/repository/game_repository_impl.dart';
import 'package:wordle_urvi_version/features/game/presentation/bloc/game_bloc.dart';

var getIt=GetIt.instance;
void setup(){
  registerDatasources();
  registerRepository();
  registerBloc();
}
void registerDatasources(){
  getIt.registerSingleton(GameRemoteDatasource(dio: DioClient.getDio()));
}
void registerRepository(){
  getIt.registerSingleton(GameRepositoryImpl(gameRemoteDatasource: getIt()));
//  getIt.registerLazySingleton(() => GameRepository());
  //getIt.registerLazySingleton(() => GameRepositoryImpl());
  //registering the repository
}
void registerBloc(){
  getIt.registerFactory(() => GameBloc(gameRepository: getIt()));
  
}
