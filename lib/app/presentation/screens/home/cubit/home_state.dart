part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState ({
    required this.cubitState,
    required this.upComingMovies,
    required this.popularMovies,
    required this.popularTvShows,
    required this.topRatedMovies,
    required this.trendingMovies
});

  final BaseCubitState cubitState;
  final Future<MovieModel> upComingMovies;
  final Future<MovieModel> trendingMovies;
  final Future<MovieModel> popularMovies;
  final Future<MovieModel> popularTvShows;
  final Future<MovieModel> topRatedMovies;


  @override
  List<Object?> get props => [
    cubitState,
    upComingMovies,
    popularTvShows,
    popularMovies,
    topRatedMovies,
    trendingMovies
  ];

  HomeState copyWith({
    BaseCubitState? cubitState,
    Future<MovieModel>? upComingMovies,
    Future<MovieModel>? popularMovies,
    Future<MovieModel>? popularTvShows,
    Future<MovieModel>? topRatedMovies,
    Future<MovieModel>? trendingMovies,
}) {
    return HomeState(
      cubitState: cubitState ?? this.cubitState,
      upComingMovies: upComingMovies ?? this.upComingMovies,
        popularMovies: popularMovies ?? this.popularMovies,
        popularTvShows: popularTvShows ?? this.popularTvShows,
        topRatedMovies: topRatedMovies ?? this.topRatedMovies,
        trendingMovies: trendingMovies ?? this.trendingMovies
    );
  }
}