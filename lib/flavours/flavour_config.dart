import 'product_config.dart';

class FlavourConfig {
  //late final Environment environment;
  late final ProductConfig config;
  bool _lock = false;

  static final FlavourConfig instance = FlavourConfig._internal();

  FlavourConfig._internal();

  factory FlavourConfig.instantiate({
   // required Environment envType,
    required ProductConfig productConfig,
  }) {
    if (instance._lock) return instance;

   // instance.environment = envType;
    instance.config = productConfig;
    instance._lock = true;

    return instance;
  }
}
