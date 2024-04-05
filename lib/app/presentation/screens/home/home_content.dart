part of '../../presentation.dart';


class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends BaseStateWrapper<HomeContent> {
  late final HomeCubit _homeScreenCubit,
      trendingFuture,
      popularMoviesFuture,
      popularTvFuture,
      topRatedFuture;

  @override
  Widget onBuild(BuildContext context, BoxConstraints constraints) {
    return BlocConsumer<HomeCubit, HomeState>(
        bloc: _homeScreenCubit,
        listener: (context, state) {
          if (state.cubitState is CubitSuccess) {
            hideLoading();
          } else if (state.cubitState is CubitError) {
            //state.cubitState.showErrorFeedback(context);
            hideLoading();
          } else if (state.cubitState is CubitLoading){
            showLoading();
          } else {
            hideLoading();
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: productConfig.theme.getBackgroundColor(),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: ListView(
                  children: [
                    UpcomingMovies(
                      future: state.upComingMovies,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MoviesListView(
                        future: state.popularTvShows,
                        headlineText: 'Popular TV Shows'),
                    MoviesListView(
                      future: state.trendingMovies,
                      headlineText: 'Trending',
                    ),
                    MoviesListView(
                      future: state.popularMovies,
                      headlineText: 'Popular Movies',
                    ),
                    MoviesListView(
                        future: state.topRatedMovies,
                        headlineText: 'Top Rated Movies'),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

  @override
  void onDispose() {
    _homeScreenCubit.dispose();
  }

  @override
  void onHide() {}

  @override
  void onInit() {
    BotToast.showLoading();

    _homeScreenCubit = context.read<HomeCubit>();

    _homeScreenCubit.getUpComingMovies();
    _homeScreenCubit.getPopularMovies();
    _homeScreenCubit.getPopularTvShows();
    _homeScreenCubit.getTopRatedMovies();
    _homeScreenCubit.getTrendingMovies();
  }

  @override
  void onPause() {}

  @override
  void onResume() {}
}
