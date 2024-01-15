library swagger.api;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:buzz/model/lightabrechnungsprecheckresponse.dart';
import 'package:buzz/model/lightabrechnungsrequest.dart';
import 'package:buzz/model/lightabrechnungsresponse.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http/http.dart';


// part 'api/medical_condition_api.dart';
// part 'api/pflegekraft_api.dart';
part 'api_client.dart';
part 'api_exception.dart';
part 'api_helper.dart';
part 'auth/api_key_auth.dart';
part 'api/abrechnung_lite_api.dart';
part 'auth/authentication.dart';
part 'auth/http_basic_auth.dart';
part 'auth/oauth.dart';


ApiClient defaultApiClient = ApiClient();
