enum Routes {
  homeScreen,
  exploreScreen
}

extension RoutesExt on Routes {
  String get route => toString().split('.').last;

  String get toPath => '/${route.toLowerCase()}';

  String get toPathWithIdParam => '/${route.toLowerCase()}/:id';

  String get toNamed => route.toLowerCase();
}
