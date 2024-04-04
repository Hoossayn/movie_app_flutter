part of '../core.dart';

extension ContextExt on BuildContext {
  AppLocalizations get localised => AppLocalizations.of(this)!;

  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  EdgeInsets get screenInset => MediaQuery.of(this).viewInsets;

  Orientation get screenOrientation => MediaQuery.of(this).orientation;

  double get screenTextScaleFactor => MediaQuery.of(this).textScaleFactor;

  TextTheme get textTheme => Theme.of(this).textTheme;

  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  double getDisplayMaxWidth() {
    return screenWidth > AppValues.maxScreenWidth
        ? AppValues.maxScreenWidth
        : screenWidth;
  }

  void showSnackBar(
    String message, {
    Duration duration = const Duration(seconds: 2),
    SnackBarAction? action,
  }) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
        action: action,
      ),
    );
  }
}

extension GlobalKeyExtension on GlobalKey {
  Rect? get globalPaintBounds {
    final renderObject = currentContext?.findRenderObject();
    final translation = renderObject?.getTransformTo(null).getTranslation();
    if (translation != null && renderObject?.paintBounds != null) {
      final offset = Offset(translation.x, translation.y);
      return renderObject!.paintBounds.shift(offset);
    } else {
      return null;
    }
  }
}
