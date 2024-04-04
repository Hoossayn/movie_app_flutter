part of '../../core.dart';

abstract class BaseCubitWrapper<T> extends Cubit<T> {
  BaseCubitWrapper(T state) : super(state);

  GetIt get inject => getIt;

  void initialize();

  void dispose();

  void emitState(T state) {
    emit(state);
  }

  void emitError(T state, Object error) {
    debugPrint(error.toString());
    emit(state);
  }

  void showLog(dynamic message) {
    debugPrint('[$runtimeType] $message');
  }
}
