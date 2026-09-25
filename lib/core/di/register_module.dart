import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_setup_clean_architectute/core/navigation/app_router.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  // @lazySingleton
  // Dio internalDio(LocalStorage storage) {
  //   final dio = Dio(
  //     BaseOptions(
  //       baseUrl: AppConfig.apiBaseUrl,
  //       connectTimeout: const Duration(seconds: 15),
  //       receiveTimeout: const Duration(seconds: 15),
  //       headers: {'Accept': 'application/json'},
  //     ),
  //   );

  //   dio.interceptors.add(AuthInterceptor(storage));
  //   return dio;
  // }

  @lazySingleton
  FlutterSecureStorage secureStorage() => const FlutterSecureStorage();

  // @lazySingleton
  // LocalStorage tokenStorage(FlutterSecureStorage s) => LocalStorage(s);

  @preResolve
  Future<AppRouter> get appRouter async => AppRouter();
}
