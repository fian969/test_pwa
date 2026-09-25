import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  // final LocalStorage storage;
  AuthInterceptor();
  // AuthInterceptor(this.storage);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // final token = await storage.readToken();
    // if (token != null && token.isNotEmpty) {
    //   options.headers['Authorization'] = 'Bearer $token';
    // }
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // final status = err.response?.statusCode ?? 0;

    // if (status == 401 || status == 403) {
    //   logger.d("///token expired broo!!!");
    //   getIt<LocalStorage>().clearToken();
    //   getIt<LocalStorage>().clearAll();
    //   SnackBarHelper.showError(
    //     "Sesi login kamu sudah habis, silakan login ulang",
    //   );
    //   logger.d("///cubit di akses!!!");
    // }

    handler.next(err);
  }
}
