import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:movie_app_flutter/app/core/core.dart';

import 'flavours/flavour_config.dart';
import 'flavours/product_config.dart';
import 'l10n/app_localizations.dart';

class BaseApp extends StatelessWidget {
  BaseApp({super.key});

  final botToastBuilder = BotToastInit();
  final ProductConfig _productConfig = FlavourConfig.instance.config;


  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Movie APP',
      theme: _productConfig.theme.theme,
      routerConfig: AppRoutes.router,
      locale: const Locale('en', ''),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        child = botToastBuilder(context, child);
        return child;
      },
    );
  }
}
