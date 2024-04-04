part of '../../presentation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseStateWrapper<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _contentWidgets = <Widget>[
    const ExploreScreen(),
    const ExploreScreen(),
    const ExploreScreen(),
  ];


  @override
  Widget onBuild(BuildContext context, BoxConstraints constraints) {
    final theme = productConfig.theme;
    return Scaffold(
        appBar: _buildAppBar(),
        bottomNavigationBar: Row(
          children: [
            const Spacer(),
            SizedBox(
              width: context.getDisplayMaxWidth(),
              child: BottomNavigationBar(
                selectedFontSize: AppValues.font10,
                unselectedFontSize: AppValues.font10,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: getIcon(
                        theme: theme,
                        iconPath: AppIcons.homeIcon,
                        index: AppValues.homeDestination),
                    label: context.localised.home,
                  ),
                  BottomNavigationBarItem(
                    icon: getIcon(
                        theme: theme,
                        iconPath: AppIcons.homeIcon,
                        index: AppValues.exploreDestination),
                    label: context.localised.explore,
                  ),
                  BottomNavigationBarItem(
                    icon: getIcon(
                        theme: theme,
                        iconPath: AppIcons.homeIcon,
                        index: AppValues.favouriteDestination),
                    label: context.localised.favourites,
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: theme.getSecondaryColor(),
                onTap: _onItemTapped,
              ),
            ),
            const Spacer()
          ],
        ),
        body: _contentWidgets[_selectedIndex]);
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      toolbarHeight: AppValues.height0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: productConfig.theme.getPrimaryColor(),
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  SvgPicture getIcon({
    required BaseTheme theme,
    required String iconPath,
    required int index,
  }) {
    return SvgPicture.asset(
      iconPath,
      height: AppValues.iconSize24,
      width: AppValues.iconSize24,
      colorFilter: getColorFilter(theme, index),
    );
  }

  ColorFilter getColorFilter(BaseTheme theme, int index) {
    return ColorFilter.mode(
      _selectedIndex == index
          ? theme.getTabBarItemSelectedColor()
          : theme.getTabBarItemColor(),
      BlendMode.srcIn,
    );
  }

  @override
  void onDispose() {}

  @override
  void onHide() {}

  @override
  void onInit() {}

  @override
  void onPause() {}

  @override
  void onResume() {}
}
