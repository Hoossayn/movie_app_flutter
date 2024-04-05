library domain;

import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:movie_app_flutter/app/data/data.dart';
import 'package:movie_app_flutter/app/data/model/movie_model.dart';


part 'base/base_use_case.dart';

part 'usecases/upcoming_movies_usecase.dart';

part 'usecases/trending_movies_usecase.dart';

part 'usecases/top_rated_movies_usecase.dart';

part 'usecases/popular_tv_shows_usecase.dart';

part 'usecases/popular_movies_usecase.dart';