part of '../remote.dart';

abstract class BaseException implements Exception {
  final String message;
  final bool status;
  final int code;

  BaseException({this.message = '', this.status = false, this.code = 401});
}

class AppException extends BaseException {
  AppException({String message = '', bool status = false, int code = 401})
      : super(message: message, status: status, code: code);
}

class NetworkException extends BaseException {
  NetworkException(String message) : super(message: message);
}

class TimeoutException extends BaseException {
  TimeoutException(String message) : super(message: message);
}

class ServiceUnavailableException extends BaseException {
  ServiceUnavailableException(String message) : super(message: message);
}

class BadRequestException extends BaseException {
  BadRequestException(String message) : super(message: message);
}

class UnauthorisedException extends BaseException {
  UnauthorisedException(String message, {int? code})
      : super(message: message, code: code ?? 401);
}

class NotFoundException extends BaseException {
  NotFoundException(String message, int code)
      : super(message: message, code: code);
}

class ApiErrorException extends BaseException {
  ApiErrorException(String message, int code)
      : super(message: message, code: code);
}
