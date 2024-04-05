part of '../domain.dart';

@injectable
class PopularTvShowsUseCase extends NoParamsUseCase<Result<MovieModel, String>> {

  final BaseRepository authApi;

  PopularTvShowsUseCase({required this.authApi});

  @override
  Future<Result<MovieModel, String>> execute() {
    return authApi.getPopularTvShows();
  }
}