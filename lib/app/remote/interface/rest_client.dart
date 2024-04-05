import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('movie/upcoming')
  Future<HttpResponse> getUpComingMovies(@Query('api_key') String apiKey);

  @GET('trending/all/day')
  Future<HttpResponse> getTrendingMovies(@Query('api_key') String apiKey);

  @GET('movie/popular')
  Future<HttpResponse> getPopularMovies(@Query('api_key') String apiKey);

  @GET('tv/popular')
  Future<HttpResponse> getPopularTvShows(@Query('api_key') String apiKey);

  @GET('movie/top_rated')
  Future<HttpResponse> getTopRatedMovies(@Query('api_key') String apiKey);

}
