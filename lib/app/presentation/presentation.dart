import 'dart:ui';

import 'package:bot_toast/bot_toast.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app_flutter/app/presentation/screens/home/cubit/home_cubit.dart';

import '../../flavours/flavour_config.dart';
import '../../utils.dart';
import '../core/base/state/base_state_wrapper.dart';
import '../core/constant/app_icons.dart';
import '../core/constant/app_values.dart';
import '../core/core.dart';
import '../data/model/credit_model.dart';
import '../data/model/movie_model.dart';
import '../data/model/review_model.dart';

part 'screens/home/home_screen.dart';

part 'screens/home/home_content.dart';

part 'screens/explore/explore_screen.dart';

part 'widgets/upcoming_movies.dart';

part 'widgets/cast_widget.dart';

part 'widgets/movie_list_view.dart';

part 'widgets/review_widget.dart';

//part 'widgets/search.dart';

part 'widgets/similar_widget.dart';