part of '../core.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) async {
    return await navigatorKey.currentContext?.pushNamed(routeName);
  }

  void goBack() {
    if (navigatorKey.currentContext?.canPop() ?? false) {
      return navigatorKey.currentContext?.pop();
    }
  }

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigatorKey;
}
