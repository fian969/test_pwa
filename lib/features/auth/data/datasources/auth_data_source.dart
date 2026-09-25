// import 'package:dio/dio.dart';
// import 'package:injectable/injectable.dart';
// import 'package:pos/core/utils/logger.dart';
// import 'package:pos/features/auth/data/models/user_by_id_model.dart';
// import '../models/auth_session_model.dart';
// import '../models/login_body.dart';

// abstract class AuthDataSource {
//   Future<AuthSessionModel> login(LoginBody body);
//   Future<UserByIdModel> getUserById(int id);
// }

// @LazySingleton(as: AuthDataSource)
// class AuthDataSourceImpl implements AuthDataSource {
//   final Dio _dio;
//   AuthDataSourceImpl(this._dio);

//   @override
//   Future<AuthSessionModel> login(LoginBody body) async {
//     // logger.i("//tes datasource auth: ${body.email} | ${body.password}");
//     final res = await _dio.post('/auth/login', data: body.toJson());
//     // logger.i("//tes datasource res auth: $res");
//     return AuthSessionModel.fromJson(res.data as Map<String, dynamic>);
//   }

//   @override
//   Future<UserByIdModel> getUserById(int id) async {
//     logger.d("///juned tes masuk ke datasource getUserById");
//     final res = await _dio.get('/auth/user/$id');
//     logger.i("///juned tes response getUserById: ${res.data}");
//     return UserByIdModel.fromJson(res.data as Map<String, dynamic>);
//   }
// }
