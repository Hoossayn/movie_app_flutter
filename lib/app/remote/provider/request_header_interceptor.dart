part of '../remote.dart';

enum ContentType { json, multipart }

class RequestHeaderInterceptor extends InterceptorsWrapper {
  RequestHeaderInterceptor(
      {required ContentType contentType, required TokenProvider tokenProvider})
      : _contentType = contentType,
        _tokenProvider = tokenProvider;

  final ContentType _contentType;
  final TokenProvider _tokenProvider;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    getHeaders().then((headers) {
      options.headers.addAll(headers);
      super.onRequest(options, handler);
    });
  }

  Future<Map<String, String>> getHeaders() async {
    var customHeaders = <String, String>{};

    if (_tokenProvider.getToken() != null) {
      customHeaders.addAll({
        'Authorization': 'Bearer ${_tokenProvider.getToken()}',
      });
    }

    switch (_contentType) {
      case ContentType.json:
        {
          customHeaders.addAll({
            'Content-Type': 'application/json; charset=utf-8',
          });
        }
        break;

      case ContentType.multipart:
        {
          customHeaders.addAll({
            'Content-Type': 'multipart/form-data; charset=utf-8',
          });
        }
        break;
    }

    customHeaders.addAll({'Accept': 'application/json'});

    return customHeaders;
  }
}
