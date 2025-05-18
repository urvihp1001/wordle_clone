import 'package:get_it/get_it.dart';
import 'package:wordle_urvi_version/features/game/presentation/bloc/game_bloc.dart';

var getIt=GetIt.instance;
void setup(){
  registerBloc();
}
void registerBloc(){
  getIt.registerFactory(() => GameBloc());
  
}
