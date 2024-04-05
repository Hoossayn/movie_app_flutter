import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app_flutter/app/presentation/screens/home/cubit/home_cubit.dart';

import '../../utils.dart';
import '../core/base/state/base_state_wrapper.dart';
import '../core/constant/app_icons.dart';
import '../core/constant/app_values.dart';
import '../core/core.dart';
import '../data/model/movie_model.dart';

part 'screens/home/home_screen.dart';

part 'screens/home/home_content.dart';

part 'screens/explore/explore_screen.dart';

part 'widgets/upcoming_movies.dart';