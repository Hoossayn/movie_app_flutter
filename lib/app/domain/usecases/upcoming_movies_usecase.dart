part of '../domain.dart';

@injectable
class UpcomingMoviesUseCase extends NoParamsUseCase<Result<MovieModel, String>> {

  final BaseRepository authApi;

  UpcomingMoviesUseCase({required this.authApi});

  @override
  Future<Result<MovieModel, String>> execute() {
    return authApi.getUpComingMovies();
  }
}