// import 'package:bloc/bloc.dart';
// import 'package:flutter/foundation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:injectable/injectable.dart';
// import 'package:pos/features/auth/data/models/login_body.dart';
// import 'package:pos/features/auth/domain/entities/auth_session.dart';
// import 'package:pos/features/auth/domain/usecases/login.dart';

// part 'login_state.dart';

// part 'login_cubit.freezed.dart';

// @injectable
// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit(this._login) : super(LoginState.initial());

//   final Login _login;

//   Future<void> login(LoginBody body) async {
//     // logger.i("//tes cubit body: $body}");
//     emit(const LoginState.loading());

//     final result =
//         await _login(LoginParams(email: body.email, password: body.password));
//     // debugPrint("//tes cubit: $result");
//     result.fold(
//       (error) => emit(LoginState.error(error.message)),
//       (data) {
//         emit(LoginState.success(data));
//       },
//     );
//   }
// }
