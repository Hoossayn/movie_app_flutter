part of '../remote.dart';

class DioProvider {
  late Dio instance;

  final int _maxLineWidth = 150;

  final TokenProvider tokenProvider;

  // constructor
  DioProvider({required this.tokenProvider}) {
    init();
  }

  void init() {
    final BaseOptions options = BaseOptions(
      connectTimeout: const Duration(minutes: 2),
      receiveTimeout: const Duration(minutes: 2),
      validateStatus: (int? status) => true,
      contentType: ContentType.json.toString(),
    );

    instance = Dio(options);
    instance.interceptors.clear();
    instance.interceptors.add(prettyDioLogger());
    instance.interceptors.add(RequestHeaderInterceptor(
      contentType: ContentType.json,
      tokenProvider: tokenProvider,
    ));
    instance.options.responseDecoder = (response, options, responseBody) {
      String utf8Decoded = utf8.decode(response, allowMalformed: true);
      if (utf8Decoded.contains('�')) {
        return latin1.decode(response, allowInvalid: true);
      } else {
        return utf8Decoded;
      }
    };
  }

  PrettyDioLogger prettyDioLogger() => PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: _maxLineWidth,
      );
}
