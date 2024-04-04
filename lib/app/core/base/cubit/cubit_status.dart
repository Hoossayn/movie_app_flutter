part of '../../core.dart';

abstract class BaseCubitState {}

abstract class BaseCubitEvent {
  static const String tag = 'BaseCubitEvent';

  static const String eventLoading = 'EVENT_LOADING';
  static const String eventSuccess = 'EVENT_SUCCESS';
  static const String eventError = 'EVENT_ERROR';
}

class CubitInitial extends BaseCubitState {}

class CubitLoading extends BaseCubitState {}

class CubitSuccess<T> extends BaseCubitState {
  final String? message;
  final T? data;

  CubitSuccess({this.message, this.data});
}

class CubitError extends BaseCubitState {
  final String message;

  CubitError({required this.message});
}

class CubitLoaded<T> extends BaseCubitState {
  final T? data;
  final String? message;

  CubitLoaded({this.data, this.message});
}

class CubitState {
  static BaseCubitState initial() => CubitInitial();

  static BaseCubitState loading() => CubitLoading();

  static BaseCubitState loaded<T>({String? event, T? data}) =>
      CubitLoaded<T>(message: event, data: data);

  static BaseCubitState success<T>({String? event, T? data}) =>
      CubitSuccess<T>(message: event, data: data);

  static BaseCubitState error({required String message}) =>
      CubitError(message: message);
}
