import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_setup_clean_architectute/core/utils/logger.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    logger.e(error);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    logger
      ..d(change.currentState)
      ..d(change.nextState);
    super.onChange(bloc, change);
  }
}
