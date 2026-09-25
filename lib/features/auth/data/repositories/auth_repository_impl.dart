// import 'dart:async';
// import 'dart:io';
// import 'package:fpdart/fpdart.dart' as fp;
// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:pos/core/di/injection.dart';
// import 'package:pos/core/error/failure.dart';
// import 'package:pos/core/storage/local_storage.dart';
// import 'package:pos/core/utils/logger.dart';
// import 'package:pos/features/auth/data/datasources/auth_data_source.dart';
// import 'package:pos/features/auth/data/models/user_by_id_model.dart';
// import '../../domain/entities/auth_session.dart';
// import '../../domain/repositories/auth_repository.dart';
// import '../models/login_body.dart';

// @LazySingleton(as: AuthRepository)
// class AuthRepositoryImpl implements AuthRepository {
//   final AuthDataSource _dataSource;

//   AuthRepositoryImpl(this._dataSource);

//   @override
//   Future<fp.Either<Failure, AuthSession>> login({
//     required String email,
//     required String password,
//   }) async {
//     try {
//       final body = LoginBody(email: email, password: password);
//       // logger.d("//repo impl tes body: $body");
//       final resp = await _dataSource.login(body);
//       // logger.d("//repo impl tes response: $resp");
//       return fp.Right(resp);
//     } on TimeoutException catch (_) {
//       return const fp.Left(
//         Failure(
//             'The request timed out. Please check your connection and try again.'),
//       );
//     } on SocketException catch (_) {
//       return const fp.Left(
//         Failure('Unable to connect to the server. Please check your internet.'),
//       );
//     } on DioException catch (e) {
//       final status = e.response?.statusCode ?? 0;
//       final msg = e.response?.data is Map
//           ? (e.response?.data['message']?.toString() ?? 'Login failed')
//           : (e.message ?? 'Login failed');
//       // Kamu bisa mapping spesifik per status code di sini.
//       return fp.Left(Failure('[$status] $msg'));
//     } catch (e) {
//       return fp.Left(Failure(e.toString()));
//     }
//   }

//   @override
//   Future<fp.Either<Failure, UserByIdModel>> getUserById(int id) async {
//     try {
//       final result = await _dataSource.getUserById(id);
//       getIt<LocalStorage>().clearStoreId();
//       getIt<LocalStorage>().saveStoreId(result.store?.id ?? 0);
//       logger.d("///juned tes di repository data: $result");
//       return fp.Right(result);
//     } on TimeoutException catch (_) {
//       return const fp.Left(Failure(
//           'The request timed out. Please ensure you have a stable internet connection and try again.'));
//     } on SocketException catch (_) {
//       return const fp.Left(Failure(
//           'Unable to connect to the server. Please check your internet connection and try again.'));
//     } on DioException catch (e) {
//       final status = e.response?.statusCode ?? 0;
//       logger.e("///juned tes error di repository data status: $status");
//       final msg = e.response?.data is Map
//           ? (e.response?.data['message']?.toString() ?? 'Login failed')
//           : (e.message ?? 'Get categories failed');
//       // return fp.Left(Failure('[$status] $msg'));
//       return fp.Left(ExpressFailure(msg, status));
//     } catch (e) {
//       logger.e("///juned tes error di repository data: $e");
//       return fp.Left(Failure(e.toString()));
//     }
//   }
// }
