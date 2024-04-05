part of '../data.dart';


abstract class BaseRepository {

  Future<Result<MovieModel, String>> getUpComingMovies();

  Future<Result<MovieModel, String>> getPopularMovies();

  Future<Result<MovieModel, String>> getPopularTvShows();

  Future<Result<MovieModel, String>> getTrendingMovies();

  Future<Result<MovieModel, String>> getTopRatedMovies();

}

@Injectable(as: BaseRepository)
class BaseRepositoryImpl implements BaseRepository {

  final BaseClient baseClient;

  BaseRepositoryImpl({
    required this.baseClient
});



  @override
  Future<Result<MovieModel, String>> getUpComingMovies() async {

    final response = await baseClient.getUpComingMovies();

    if (response.hasError) {
      return Result(error: response.error.message);
    }

    final data = response.response?.data;
    if (data == null || data.isEmpty) {
      return Result(error: 'Something went wrong');
    }

    var parsedData = MovieModel.fromJson(data);
    return Result(response: parsedData);
  }

  @override
  Future<Result<MovieModel, String>> getPopularMovies() async {
    final response = await baseClient.getPopularMovies();

    if (response.hasError) {
      return Result(error: response.error.message);
    }

    final data = response.response?.data;
    if (data == null || data.isEmpty) {
      return Result(error: 'Something went wrong');
    }

    var parsedData = MovieModel.fromJson(data);
    return Result(response: parsedData);
  }

  @override
  Future<Result<MovieModel, String>> getPopularTvShows() async {
    final response = await baseClient.getPopularTvShows();

    if (response.hasError) {
      return Result(error: response.error.message);
    }

    final data = response.response?.data;
    if (data == null || data.isEmpty) {
      return Result(error: 'Something went wrong');
    }

    var parsedData = MovieModel.fromJson(data);
    return Result(response: parsedData);
  }

  @override
  Future<Result<MovieModel, String>> getTopRatedMovies() async {
    final response = await baseClient.getTopRatedMovies();

    if (response.hasError) {
      return Result(error: response.error.message);
    }

    final data = response.response?.data;
    if (data == null || data.isEmpty) {
      return Result(error: 'Something went wrong');
    }

    var parsedData = MovieModel.fromJson(data);
    return Result(response: parsedData);
  }

  @override
  Future<Result<MovieModel, String>> getTrendingMovies() async {
    final response = await baseClient.getTrendingMovies();

    if (response.hasError) {
      return Result(error: response.error.message);
    }

    final data = response.response?.data;
    if (data == null || data.isEmpty) {
      return Result(error: 'Something went wrong');
    }

    var parsedData = MovieModel.fromJson(data);
    return Result(response: parsedData);
  }

}