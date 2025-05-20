abstract class Either<L, R> {
 T fold<T>(T Function(L l) left, T Function(R r) right);
}
  class Left<L, R> implements Either<L, R> {
    final L value;
  
    Left(this.value);
  
    @override
    T fold<T>(T Function(L l) left, T Function(R r) right) {
      return left(value);
    }
  }

  class Right<L, R> implements Either<L, R> {
    final R value;
  
    Right(this.value);
  
    @override
    T fold<T>(T Function(L l) left, T Function(R r) right) {
      return right(value);
    }
  }

  /*
  No matter what happens the above function will return either an object of Either with CustomException (Means Left) or an object of Either with String (Means Right).

Now if you use the function like:

final eitherData = getSomething();
You will be getting an either object (Object of Left or Right). Instead of checking whether that eitherData is of type Left or Right, you can call the fold method on that object like below:

eitherData.fold<Widget>(
   (err) => Text('Error Happened: $err'), // ifLeft callback
   (data) => Text('Got data: $data'), // ifRight callback
)
As I mentioned earlier based on the object type the corresponding callback will get triggered and you can gracefully handle the success and error cases without writing any if else statements or type checks.
*/