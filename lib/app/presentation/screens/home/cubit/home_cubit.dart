import 'package:equatable/equatable.dart';
import 'package:movie_app_flutter/app/core/core.dart';

part 'home_state.dart';

class HomeCubit extends BaseCubitWrapper<HomeState>{
  HomeCubit () : super (HomeState(cubitState: CubitState.initial()));

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void initialize() {
    // TODO: implement initialize
  }
}