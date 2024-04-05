part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState ({
    required this.cubitState,
    required this.upComingMovies
});

final BaseCubitState cubitState;
final Future<MovieModel> upComingMovies;


  @override
  List<Object?> get props => [
    cubitState,
    upComingMovies
  ];

  HomeState copyWith({
    BaseCubitState? cubitState,
    Future<MovieModel>? upComingMovies,
}) {
    return HomeState(
      cubitState: cubitState ?? this.cubitState,
      upComingMovies: upComingMovies ?? this.upComingMovies
    );
  }
}