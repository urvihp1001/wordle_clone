import 'package:wordle_urvi_version/core/failure/failure.dart';
import 'package:wordle_urvi_version/core/model/either.dart';

abstract class GameRepository{
  Future<Either<Failure,String>> getRandomWord(int length);//left-- handle failure
  //right-- handle getting a random word
  Future<Either<Failure,void>> checkWord(String word);
  //left-- handle failure
  //right-- handle checking a word

}
//acts as a middleman between the data layer and the presentation layer(bloc)
/*BLoC = handles logic

Repository = fetches/saves data

Data source = actual storage/API
*/
/*Example:
Let’s say you want to get a list of events.

The BLoC says: "Hey repository, give me the events."

The Repository says: "Okay, I’ll go fetch them from Firebase (or wherever)."

The Repository gets the data and gives it to the BLoC.

The BLoC processes it and updates the UI.
TL;DR:
Repository = separates logic from data fetching. Makes code cleaner, testable, and easier to manage. */
//tldr: repo is the agent that gets info from src- api, db, etc and gives it to the bloc. bloc doesnt care where the data comes from. it just needs the data.
//so tmrw if the source changes from firebase to rest api, only the repo changes. not the bloc.