import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../remote/remote.dart';

@module
abstract class RemoteModule {
  @singleton
  TokenProvider get tokenProvider => TokenProvider();

  @singleton
  DioProvider get dioProvider => DioProvider(tokenProvider: tokenProvider);

  @singleton
  Dio get dio => dioProvider.instance;

  @singleton
  ResponseParserHandler get responseParserHandler => ResponseParserHandler();

}
