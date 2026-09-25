// import 'package:fpdart/fpdart.dart' as fp;
// import 'package:injectable/injectable.dart';
// import 'package:pos/core/app/use_case.dart';
// import 'package:pos/core/error/failure.dart';
// import 'package:pos/core/utils/logger.dart';
// import 'package:pos/features/auth/data/models/user_by_id_model.dart';
// import '../repositories/auth_repository.dart';

// @injectable
// class GetUser extends UseCase<UserByIdModel, int> {
//   final AuthRepository _repository;
//   GetUser(this._repository);

//   @override
//   Future<fp.Either<Failure, UserByIdModel>> call(int argument) {
//     logger.d("///juned cek argument usecase: $argument");
//     return _repository.getUserById(argument);
//   }
// }
