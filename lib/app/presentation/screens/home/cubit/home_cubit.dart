import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/app/core/core.dart';
import 'package:movie_app_flutter/app/domain/domain.dart';

import '../../../../data/model/movie_model.dart';

part 'home_state.dart';

class HomeCubit extends BaseCubitWrapper<HomeState>{
  HomeCubit ({
    required UpcomingMoviesUseCase upcomingMoviesUseCase
}) : _upcomingMoviesUseCase = upcomingMoviesUseCase,
        super (
          HomeState(
              cubitState: CubitState.initial(),
              upComingMovies: Future.value(MovieModel(results: []))
          )
      );


  late final UpcomingMoviesUseCase _upcomingMoviesUseCase;

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


  @override
  void dispose() {}

  @override
  void initialize() {}
}