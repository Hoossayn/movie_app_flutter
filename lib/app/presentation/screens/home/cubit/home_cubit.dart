import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/app/core/core.dart';
import 'package:movie_app_flutter/app/domain/domain.dart';

import '../../../../data/model/movie_model.dart';

part 'home_state.dart';

class HomeCubit extends BaseCubitWrapper<HomeState>{
  HomeCubit ({
    required UpcomingMoviesUseCase upcomingMoviesUseCase,
    required PopularTvShowsUseCase popularTvShowsUseCase,
    required PopularMoviesUseCase popularMoviesUseCase,
    required TopRatedMoviesUseCase topRatedMoviesUseCase,
    required TrendingMoviesUseCase trendingMoviesUseCase
}) : _upcomingMoviesUseCase = upcomingMoviesUseCase,
     _popularTvShowsUseCase = popularTvShowsUseCase,
     _popularMoviesUseCase = popularMoviesUseCase,
     _topRatedMoviesUseCase = topRatedMoviesUseCase,
     _trendingMoviesUseCase = trendingMoviesUseCase,
        super (
          HomeState(
              cubitState: CubitState.initial(),
              upComingMovies: Future.value(MovieModel(results: [])),
              popularMovies:  Future.value(MovieModel(results: [])),
              popularTvShows: Future.value(MovieModel(results: [])),
              topRatedMovies: Future.value(MovieModel(results: [])),
              trendingMovies: Future.value(MovieModel(results: []))
          )
      );


  late final UpcomingMoviesUseCase _upcomingMoviesUseCase;
  late final PopularMoviesUseCase _popularMoviesUseCase;
  late final PopularTvShowsUseCase _popularTvShowsUseCase;
  late final TopRatedMoviesUseCase _topRatedMoviesUseCase;
  late final TrendingMoviesUseCase _trendingMoviesUseCase;

  Future<void> getUpComingMovies() async {
    emit(
      state.copyWith(cubitState: CubitLoading()),
    );
    var result = await _upcomingMoviesUseCase.execute();
    if (result.hasError) {
      emit(
        state.copyWith(
            cubitState: CubitError(message: result.error ?? '')),
      );
    } else {
      emit(
        state.copyWith(
            cubitState: CubitSuccess(),
          upComingMovies: Future.value(result.response)
        ),
      );
    }
  }

  Future<void> getPopularMovies() async {
    emit(
      state.copyWith(cubitState: CubitLoading()),
    );
    var result = await _popularMoviesUseCase.execute();
    if (result.hasError) {
      emit(
        state.copyWith(
            cubitState: CubitError(message: result.error ?? '')),
      );
    } else {
      emit(
        state.copyWith(
            cubitState: CubitSuccess(),
            popularMovies: Future.value(result.response)
        ),
      );
    }
  }

  Future<void> getPopularTvShows() async {
    emit(
      state.copyWith(cubitState: CubitLoading()),
    );
    var result = await _popularTvShowsUseCase.execute();
    if (result.hasError) {
      emit(
        state.copyWith(
            cubitState: CubitError(message: result.error ?? '')),
      );
    } else {
      emit(
        state.copyWith(
            cubitState: CubitSuccess(),
            popularTvShows: Future.value(result.response)
        ),
      );
    }
  }

  Future<void> getTopRatedMovies() async {
    emit(
      state.copyWith(cubitState: CubitLoading()),
    );
    var result = await _topRatedMoviesUseCase.execute();
    if (result.hasError) {
      emit(
        state.copyWith(
            cubitState: CubitError(message: result.error ?? '')),
      );
    } else {
      emit(
        state.copyWith(
            cubitState: CubitSuccess(),
            topRatedMovies: Future.value(result.response)
        ),
      );
    }
  }

  Future<void> getTrendingMovies() async {
    emit(
      state.copyWith(cubitState: CubitLoading()),
    );
    var result = await _trendingMoviesUseCase.execute();
    if (result.hasError) {
      emit(
        state.copyWith(
            cubitState: CubitError(message: result.error ?? '')),
      );
    } else {
      emit(
        state.copyWith(
            cubitState: CubitSuccess(),
            trendingMovies: Future.value(result.response)
        ),
      );
    }
  }

  @override
  void dispose() {}

  @override
  void initialize() {}
}