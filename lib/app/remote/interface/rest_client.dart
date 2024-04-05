import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST('/loan-applications')
  Future<HttpResponse> createApplication(@Body() Map<String, dynamic> param);

  @GET('/movie/upcoming')
  Future<HttpResponse> getUpComingMovies(@Query('api_key') String apiKey);


}
