part of '../remote.dart';


abstract class BaseClient {

  Future<Result<Success<dynamic>, dynamic>> getUpComingMovies();
}

@Injectable(as: BaseClient)
class BaseClientImpl extends BaseClient {
  final RestClient _restClient;
  final Dio dio;
  final ResponseParserHandler responseParserHandler;

  BaseClientImpl({
    required this.dio,
    required this.responseParserHandler,
  }) : _restClient = RestClient(dio,
            baseUrl: 'https://api.themoviedb.org/3/');

  @override
  Future<Result<Success, dynamic>> getUpComingMovies() async {
    try {
      var response = await _restClient.getUpComingMovies('7502b8c031c79790fe5c0b4f94fd770d');
      var parsedResponse = await responseParserHandler
          .parseDataHttpResponseWithErrorHandler(response);
      return parsedResponse;
    } on DioException catch (e) {
      return Result<Success, Exception>(
          response: null, error: responseParserHandler.handleDioError(e));
    }
  }
}
