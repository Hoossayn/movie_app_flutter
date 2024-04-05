part of '../remote.dart';


abstract class BaseClient {

  Future<Result<Success<dynamic>, dynamic>> getUpComingMovies();

  Future<Result<Success<dynamic>, dynamic>> getTrendingMovies();

  Future<Result<Success<dynamic>, dynamic>> getPopularMovies();

  Future<Result<Success<dynamic>, dynamic>> getPopularTvShows();

  Future<Result<Success<dynamic>, dynamic>> getTopRatedMovies();

}

@Injectable(as: BaseClient)
class BaseClientImpl extends BaseClient {
  final RestClient _restClient;
  final Dio dio;
  final ResponseParserHandler responseParserHandler;

  BaseClientImpl({
    required this.dio,
    required this.responseParserHandler,
  }) : _restClient = RestClient(dio, baseUrl: baseUrl);

  @override
  Future<Result<Success, dynamic>> getUpComingMovies() async {
    try {
      var response = await _restClient.getUpComingMovies(apiKey);
      var parsedResponse = await responseParserHandler
          .parseDataHttpResponseWithErrorHandler(response);
      return parsedResponse;
    } on DioException catch (e) {
      return Result<Success, Exception>(
          response: null, error: responseParserHandler.handleDioError(e));
    }
  }

  @override
  Future<Result<Success, dynamic>> getPopularMovies() async {
    try {
      var response = await _restClient.getPopularMovies(apiKey);
      var parsedResponse = await responseParserHandler
          .parseDataHttpResponseWithErrorHandler(response);
      return parsedResponse;
    } on DioException catch (e) {
      return Result<Success, Exception>(
          response: null, error: responseParserHandler.handleDioError(e));
    }
  }

  @override
  Future<Result<Success, dynamic>> getPopularTvShows() async {
    try {
      var response = await _restClient.getPopularTvShows(apiKey);
      var parsedResponse = await responseParserHandler
          .parseDataHttpResponseWithErrorHandler(response);
      return parsedResponse;
    } on DioException catch (e) {
      return Result<Success, Exception>(
          response: null, error: responseParserHandler.handleDioError(e));
    }
  }

  @override
  Future<Result<Success, dynamic>> getTopRatedMovies() async {
    try {
      var response = await _restClient.getTopRatedMovies(apiKey);
      var parsedResponse = await responseParserHandler
          .parseDataHttpResponseWithErrorHandler(response);
      return parsedResponse;
    } on DioException catch (e) {
      return Result<Success, Exception>(
          response: null, error: responseParserHandler.handleDioError(e));
    }
  }

  @override
  Future<Result<Success, dynamic>> getTrendingMovies() async {
    try {
      var response = await _restClient.getTrendingMovies(apiKey);
      var parsedResponse = await responseParserHandler
          .parseDataHttpResponseWithErrorHandler(response);
      return parsedResponse;
    } on DioException catch (e) {
      return Result<Success, Exception>(
          response: null, error: responseParserHandler.handleDioError(e));
    }
  }
}
