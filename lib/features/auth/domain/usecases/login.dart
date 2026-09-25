// import 'package:fpdart/fpdart.dart' as fp;
// import 'package:injectable/injectable.dart';
// import 'package:pos/core/app/use_case.dart';
// import 'package:pos/core/error/failure.dart';
// import '../entities/auth_session.dart';
// import '../repositories/auth_repository.dart';

// @injectable
// class Login extends UseCase<AuthSession, LoginParams> {
//   final AuthRepository _repository;
//   Login(this._repository);

//   @override
//   Future<fp.Either<Failure, AuthSession>> call(LoginParams params) {
//     // logger.d("//cek param usecase login: ${params.email}, ${params.password}");
//     return _repository.login(
//       email: params.email,
//       password: params.password,
//     );
//   }
// }

// class LoginParams {
//   final String email;
//   final String password;
//   const LoginParams({required this.email, required this.password});
// }

