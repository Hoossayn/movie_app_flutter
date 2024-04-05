part of '../data.dart';


abstract class BaseRepository {

  Future<Result<MovieModel, String>> getUpComingMovies();

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

}