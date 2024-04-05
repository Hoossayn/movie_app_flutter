part of '../remote.dart';

class ResponseParserHandler {

  dynamic handleUploadResponse(http.Response response) {
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Result<Success, Exception>(
            response: Success.fromJson(response.headers), error: null);
      } else if (response.statusCode == 401) {
        return parseUnauthorisedError();
      } else {
        Exception exception = handleError(response.body);
        return Result<Success, Exception>(response: null, error: exception);
      }
    } on DioException catch (dioError) {
      Exception exception = handleDioError(dioError);
      return Result<Success, Exception>(response: null, error: exception);
    } catch (error) {
      if (error is BaseException) {
        rethrow;
      }
      return Result<Success, Exception>(
          response: null, error: handleError(error.toString()));
    }
  }

  Future<Result<Success, Exception>> parseDataHttpResponseWithErrorHandler(
      dynamic response) async {
    try {
      response_retrofit.HttpResponse httpResponse =
          response as response_retrofit.HttpResponse;
      if (httpResponse.response.statusCode == 200 ||
          httpResponse.response.statusCode == 201 ||
          httpResponse.response.statusCode == 204) {
        return Result<Success, Exception>(
            response: Success(
                message: 'success', status: true, data: httpResponse.data),
            error: null);
      } else if (httpResponse.response.statusCode == 400) {
        final error = httpResponse.data['message'];
        if (error != null) {
          return Result<Success, Exception>(
              response: null, error: BadRequestException(error));
        } else {
          final errors = httpResponse.data['errors'];
          List<String> processedErrorMessages = List.empty(growable: true);
          for (var error in errors) {
            processedErrorMessages.add('${error['message']}');
          }
          Exception exception = handleError(processedErrorMessages.join('\n'));
          return Result<Success, Exception>(response: null, error: exception);
        }
      } else if (httpResponse.response.statusCode == 401) {
        return Result<Success, Exception>(
            response: null,
            error: UnauthorisedException(
              httpResponse.data,
              code: httpResponse.response.statusCode,
            ));
      } else {
        Exception exception = handleError(httpResponse.data['message']);
        return Result<Success, Exception>(response: null, error: exception);
      }
    } on DioException catch (dioError) {
      Exception exception = handleDioError(dioError);
      return Result<Success, Exception>(response: null, error: exception);
    } catch (error) {
      if (error is BaseException) {
        rethrow;
      }
      return Result<Success, Exception>(
          response: null, error: handleError(error.toString()));
    }
  }


  Exception handleError(String error) {
    debugPrint('Generic exception: $error');
    return AppException(message: error);
  }

  Exception handleDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        return AppException(message: 'Request to API server was cancelled');
      case DioExceptionType.connectionTimeout:
        return AppException(message: 'Connection timeout with API server');
      case DioExceptionType.receiveTimeout:
        return TimeoutException(
            'Receive timeout in connection with API server');
      case DioExceptionType.sendTimeout:
        return TimeoutException('Send timeout in connection with API server');
      case DioExceptionType.badResponse:
        return _parseDioErrorResponse(dioError);
      case DioExceptionType.badCertificate:
        return Exception('Incorrect certificate');
      case DioExceptionType.connectionError:
        return AppException(message: ErrorMessages.networkError);
      case DioExceptionType.unknown:
        return Exception(dioError.message);
    }
  }

  Exception _parseDioErrorResponse(DioException dioError) {
    int statusCode = dioError.response?.statusCode ?? -1;
    bool? status;
    String? serverMessage;
    List messages = [];

    if (dioError.response?.data is List) {
      for (var error in dioError.response?.data) {
        status = error['status'];
        messages.add(error['message']);
      }
      serverMessage = messages.toString();
    } else if (dioError.response?.data is String) {
      status = false;
      serverMessage = dioError.response?.data;
    } else {
      status = dioError.response?.data['status'] ?? '';

      if (dioError.response?.data['message'] is List) {
        serverMessage = (dioError.response?.data['message'] as List).join(' ');
      } else {
        serverMessage = dioError.response?.data['message'];
      }
    }

    debugPrint('Server message: $serverMessage || Status: $status');

    switch (statusCode) {
      case HttpStatus.serviceUnavailable:
        return ServiceUnavailableException('Service Temporarily Unavailable');
      case HttpStatus.notFound:
        return NotFoundException(serverMessage ?? '', HttpStatus.notFound);
      case HttpStatus.unauthorized:
        return UnauthorisedException(serverMessage ?? '');
      case HttpStatus.forbidden:
        return UnauthorisedException(serverMessage ?? '');
      default:
        var e = ApiErrorException(
          serverMessage ?? '',
          statusCode,
        );
        return e;
    }
  }

  Future<Result<Success, Exception>> parseUnauthorisedError() async {
    return Result<Success, Exception>(
      response: null,
      error: UnauthorisedException(
        AppStrings.sessionError,
      ),
    );
  }
}
