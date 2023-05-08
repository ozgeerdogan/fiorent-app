// ignore_for_file: no_leading_underscores_for_local_identifiers, prefer_collection_literals

import 'dart:convert';

import 'package:fiorent_cloud_mobile/controllers/language_controller.dart';
import 'package:fiorent_cloud_mobile/model/language_model.dart';
import 'package:fiorent_cloud_mobile/utils/app_constants.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<Map <String, Map<String, String>>> init() async {
  // ignore: non_constant_identifier_names
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));

  Map<String, Map<String, String>> _language = Map();
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle
        .loadString("assets/language/${languageModel.languageCode}.json");  //${languageModel.languageCode}
    Map<String, dynamic> _mappedJson = json.decode(jsonStringValues);
    Map<String, String> _json = Map();

    _mappedJson.forEach((key, value) {
      _json[key] = value.toString();
    });
    _language["${languageModel.languageCode}_${languageModel.countryCode}"] =
        _json;
  }
  return _language;
}
