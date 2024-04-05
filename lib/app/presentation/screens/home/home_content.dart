part of '../../presentation.dart';


class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends BaseStateWrapper<HomeContent> {
  late final HomeCubit _homeScreenCubit;

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
          return Center(
            child: UpcomingMovies(
              future: state.upComingMovies,
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
    _homeScreenCubit = context.read<HomeCubit>();

    _homeScreenCubit.getUpComingMovies();
  }

  @override
  void onPause() {}

  @override
  void onResume() {}
}
