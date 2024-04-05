
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app_flutter/app/presentation/screens/home/cubit/home_cubit.dart';
import '../../domain/domain.dart';
import 'di.config.dart';

final getIt = GetIt.instance;

const web = Environment('web');
const mobile = Environment('mobile');

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: false,
)
Future<void> configureDependencies({Environment environment = mobile}) async {
  init(getIt, environment: environment.name);
}

List<BlocProvider> initialiseCubits() {
  return [
    BlocProvider<HomeCubit>(
      create: (context) =>
          HomeCubit(upcomingMoviesUseCase: getIt.get<UpcomingMoviesUseCase>()),
    ),
  ];
}
