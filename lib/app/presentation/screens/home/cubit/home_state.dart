part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState ({
    required this.cubitState
});

final BaseCubitState cubitState;

  @override
  // TODO: implement props
  List<Object?> get props => [
    cubitState
  ];

  HomeState copyWith({
    BaseCubitState? cubitState,
}) {
    return HomeState(cubitState: cubitState ?? this.cubitState,);
  }
}