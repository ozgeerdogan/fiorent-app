import 'package:fiorent_cloud_mobile/model/language_model.dart';

class AppConstants{
  // ignore: constant_identifier_names
  static const String COUNTRY_CODE = "country_code";
  // ignore: constant_identifier_names
  static const String LANGUAGE_CODE = "language_code";

  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: "en.png", languageName: "English", languageCode: "en", countryCode: "US"),
    LanguageModel(imageUrl: "tr.png", languageName: "Turkish", languageCode: "tr", countryCode: "TR")
  ];
}