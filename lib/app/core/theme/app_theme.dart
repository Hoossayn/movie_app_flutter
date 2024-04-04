part of '../core.dart';

abstract class BaseTheme {
  Color getIconBackgroundColor();

  Color getPrimaryColor();

  Color getSecondaryColor();

  Color getPrimaryTextColor();

  Color getSecondaryTextColor();

  Color getStatusBarColor();

  Color getStatusBarIconColor();

  Color getErrorColor();

  Color getBackgroundColor();

  Color getTabBarItemSelectedColor();

  Color getTabBarItemColor();

  Brightness getStatusBarIconBrightness();

  Brightness getStatusBarBrightness();

  Color getWhiteTextColor();

  Color getLightGreyBGColor();

  ButtonStyle borderlessButtonStyle = const ButtonStyle();

  TextStyle title1 = const TextStyle();

  TextStyle filledButtonTextStyle = const TextStyle();

  TextStyle borderedButtonTextStyle = const TextStyle();

  TextStyle errorTextStyle = const TextStyle();

  TextStyle getLabelExtraLargeStyle = const TextStyle();

  TextStyle getLabelExtraLargeBoldStyle = const TextStyle();

  TextStyle homeButtonTextStyle = const TextStyle();

  TextStyle displayMediumTextStyle = const TextStyle();

  TextStyle bodySmallTextStyle = const TextStyle();

  TextStyle bodyMediumTextStyle = const TextStyle();

  TextStyle displaySmallTextStyle = const TextStyle();

  TextStyle bodySmallBoldTextStyle = const TextStyle();

  TextStyle titleSmallTextStyle = const TextStyle();

  TextStyle bodySmallSemiBoldTextStyle = const TextStyle();

  ThemeData theme = ThemeData();
}

class AppLightScheme extends BaseTheme {
  static AppLightScheme? _instance;

  factory AppLightScheme() {
    _instance ??= AppLightScheme._internal();
    return _instance!;
  }

  AppLightScheme._internal();


  @override
  Color getBackgroundColor() {
    return const Color(0xFFF5F5F5);
  }


  @override
  Color getErrorColor() {
    return const Color(0xFFC0492C);
  }

  @override
  Color getIconBackgroundColor() {
    return const Color(0xFFEEEEEE);
  }


  @override
  Color getPrimaryColor() {
    return const Color(0xFF542F85);
  }

  @override
  Color getPrimaryTextColor() {
    return const Color(0xFF2B2D32);
  }

  @override
  Color getSecondaryColor() {
    return const Color(0xFFA049B1);
  }

  @override
  Color getSecondaryTextColor() {
    return const Color(0xA32B2D32);
  }


  @override
  Color getStatusBarColor() {
    return const Color(0xFF542F85);
  }

  @override
  Color getStatusBarIconColor() {
    return const Color(0xFFFFFFFF);
  }

  @override
  Brightness getStatusBarIconBrightness() {
    return Brightness.light;
  }

  @override
  Brightness getStatusBarBrightness() {
    return Brightness.light;
  }

  @override
  Color getTabBarItemColor() {
    return const Color(0xFF9A9EA9);
  }


  @override
  Color getTabBarItemSelectedColor() {
    return const Color(0xFFA049B1);
  }


  @override
  Color getWhiteTextColor() {
    return const Color(0xFFFFFFFF);
  }


  @override
  Color getLightGreyBGColor() {
    return const Color(0xFFFAFAFA);
  }

  @override
  get title1 {
    return TextStyle(
        color: getPrimaryTextColor(),
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
        fontSize: 20);
  }

  @override
  get displayMediumTextStyle {
    return TextStyle(
      color: getPrimaryTextColor(),
      fontSize: 16,
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
    );
  }

  @override
  get bodySmallTextStyle {
    return TextStyle(
      color: getPrimaryTextColor(),
      fontSize: 12,
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
    );
  }


  @override
  get bodyMediumTextStyle {
    return TextStyle(
      color: getPrimaryTextColor(),
      fontSize: 14,
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
    );
  }

  @override
  get displaySmallTextStyle {
    return TextStyle(
      color: getPrimaryTextColor(),
      fontSize: 14,
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
    );
  }

  @override
  get titleSmallTextStyle {
    return TextStyle(
      color: getPrimaryTextColor(),
      fontSize: 14,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    );
  }

  @override
  get bodySmallBoldTextStyle {
    return TextStyle(
      color: getPrimaryTextColor(),
      fontSize: 12,
      fontFamily: 'Inter',
      fontWeight: FontWeight.bold,
    );
  }

  @override
  get getLabelExtraLargeStyle {
    return TextStyle(
        color: getPrimaryTextColor(),
        fontWeight: FontWeight.w500,
        fontFamily: 'Inter',
        fontSize: 18);
  }

  @override
  get getLabelExtraLargeBoldStyle {
    return TextStyle(
        color: getPrimaryTextColor(),
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
        fontSize: 18);
  }

  @override
  get errorTextStyle {
    return const TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.normal,
      fontSize: 14,
      color: Color(0xFFC0492C),
    );
  }

  @override
  get borderlessButtonStyle {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      textStyle: MaterialStateProperty.all(
        const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
      padding: MaterialStateProperty.all(EdgeInsets.zero),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.disabled)) {
          return getSecondaryColor().withOpacity(0.5);
        }
        return getSecondaryColor();
      }),
    );
  }

  @override
  get filledButtonTextStyle {
    return const TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: Colors.white,
    );
  }

  @override
  get borderedButtonTextStyle {
    return TextStyle(
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      fontSize: 16,
      color: getSecondaryColor(),
    );
  }


  @override
  get theme {
    return ThemeData(
      primaryColor: getPrimaryColor(),
      fontFamily: 'Inter',
      colorScheme: ColorScheme.fromSwatch().copyWith(
        background: getBackgroundColor(),
        error: getErrorColor(),
        primary: getPrimaryColor(),
        secondary: getSecondaryColor(),
        brightness: Brightness.light,
      ),
      scaffoldBackgroundColor: getBackgroundColor(),
      textTheme: TextTheme(
        titleLarge: TextStyle(
            color: getPrimaryTextColor(),
            fontSize: 18,
            fontWeight: FontWeight.w600),
        titleMedium: TextStyle(
            color: getPrimaryTextColor(),
            fontSize: 16,
            fontWeight: FontWeight.w600),
        titleSmall: titleSmallTextStyle,
        displayLarge: TextStyle(
            color: getPrimaryTextColor(),
            fontSize: 18,
            fontWeight: FontWeight.bold),
        displayMedium: displayMediumTextStyle,
        displaySmall: displaySmallTextStyle,
        bodyLarge: TextStyle(
            color: getPrimaryTextColor(),
            fontSize: 16,
            fontWeight: FontWeight.normal),
        bodyMedium: bodyMediumTextStyle,
        bodySmall: bodySmallTextStyle,
        labelLarge: TextStyle(
            color: getPrimaryTextColor(),
            fontSize: 16,
            fontWeight: FontWeight.w500),
        labelMedium: TextStyle(
            color: getPrimaryTextColor(),
            fontSize: 14,
            fontWeight: FontWeight.w500),
        labelSmall: TextStyle(
            color: getPrimaryTextColor(),
            fontSize: 12,
            fontWeight: FontWeight.w500),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          foregroundColor: Colors.white,
          backgroundColor: getSecondaryColor(), // background color
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          side: BorderSide(
            width: 2,
            color: getSecondaryColor(),
          ),
          foregroundColor: getSecondaryColor(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return getSecondaryColor().withOpacity(0.5);
            }
            return getSecondaryColor();
          }),
          textStyle: MaterialStateProperty.all(
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          foregroundColor: MaterialStateProperty.all(Colors.white),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: getStatusBarColor(),
        iconTheme: IconThemeData(color: getStatusBarIconColor()),
        actionsIconTheme: IconThemeData(color: getStatusBarIconColor()),
        centerTitle: true,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: getStatusBarColor(),
            statusBarIconBrightness: getStatusBarIconBrightness(),
            statusBarBrightness: getStatusBarBrightness(),
            systemStatusBarContrastEnforced: false),
        titleTextStyle: TextStyle(
            color: getPrimaryColor(),
            fontSize: 16,
            fontWeight: FontWeight.w600),
      ),
    );
  }

}
