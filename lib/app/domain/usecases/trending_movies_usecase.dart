part of '../domain.dart';

@injectable
class TrendingMoviesUseCase extends NoParamsUseCase<Result<MovieModel, String>> {

  final BaseRepository authApi;

  TrendingMoviesUseCase({required this.authApi});

  @override
  Future<Result<MovieModel, String>> execute() {
    return authApi.getTrendingMovies();
  }
}