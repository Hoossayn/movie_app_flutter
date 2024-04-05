part of '../domain.dart';

@injectable
class PopularMoviesUseCase extends NoParamsUseCase<Result<MovieModel, String>> {

  final BaseRepository authApi;

  PopularMoviesUseCase({required this.authApi});

  @override
  Future<Result<MovieModel, String>> execute() {
    return authApi.getPopularMovies();
  }
}