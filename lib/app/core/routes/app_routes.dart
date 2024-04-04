part of '../core.dart';

class AppRoutes {
  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      Scaffold(
        body: Center(
          child: Text(
            'No route defined for ${state.matchedLocation}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      );

  static final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        name: Routes.homeScreen.toNamed,
        builder: (context, state) => const HomeScreen(),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: Routes.exploreScreen.toPath,
        name: Routes.exploreScreen.toNamed,
        builder: (context, state) => const ExploreScreen(
        ),
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const ExploreScreen(),
        ),
      ),
    ],
    errorBuilder: errorWidget,
    redirect: (context, state) async {
      return state.name;
    },
    navigatorKey: getIt<NavigationService>().navigatorKey,
    observers: [BotToastNavigatorObserver()],
  );

  static GoRouter get router => _router;
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child),
    transitionDuration: const Duration(milliseconds: 300),
  );
}
