import '../../../../core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class UseCase<Type, Argument> {
  Future<Either<Failure, Type>> call(Argument argument);
}

abstract class UseCaseWithoutArgument<Type> {
  Future<Either<Failure, Type>> call();
}
