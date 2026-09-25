import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_setup_clean_architectute/core/app/app.dart';
import 'package:flutter_setup_clean_architectute/core/utils/observer.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'core/di/injection.dart';

Future<void> main() async {
  final binding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  await _initializeApp();

  runApp(const App());
  // runApp(
  //   MultiBlocProvider(
  //     providers: const [
  //       // BlocProvider<GetProductCubit>(create: (_) => getIt()),
  //       // BlocProvider<GetTransactionCubit>(create: (_) => getIt()),
  //       // BlocProvider<GetUserCubit>(create: (_) => getIt()),
  //       // BlocProvider<CartTrxCubit>.value(value: getIt<CartTrxCubit>()),
  //     ],
  //     child: const App(),
  //   ),
  // );
}

Future<void> _initializeApp() async {
  try {
    await configureDependencies();
    await initializeDateFormatting('id_ID', null);
    Bloc.observer = AppBlocObserver();
  } catch (e, stackTrace) {
    debugPrint('Kesalahan saat inisialisasi: $e');
    debugPrintStack(stackTrace: stackTrace);
  } finally {
    FlutterNativeSplash.remove();
  }
}
