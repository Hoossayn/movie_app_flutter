library remote;

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/dio.dart' as response_retrofit;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dio/dio.dart';
import '../core/constant/app_strings.dart';
import '../data/data.dart';


part 'exceptions/exceptions.dart';

part 'exceptions/response_parser_handler.dart';

part 'provider/dio_provider.dart';

part 'provider/request_header_interceptor.dart';

part 'provider/token_provider.dart';

