import 'package:injectable/injectable.dart';

import '../core.dart';

@module
abstract class ServiceModule {
  @singleton
  NavigationService get navigationService => NavigationService();
}
