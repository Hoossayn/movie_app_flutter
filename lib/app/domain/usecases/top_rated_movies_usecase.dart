part of '../domain.dart';

@injectable
class TopRatedMoviesUseCase extends NoParamsUseCase<Result<MovieModel, String>> {

  final BaseRepository authApi;

  TopRatedMoviesUseCase({required this.authApi});

  @override
  Future<Result<MovieModel, String>> execute() {
    return authApi.getTopRatedMovies();
  }
}