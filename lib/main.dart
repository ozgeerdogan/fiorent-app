import 'package:fiorent_cloud_mobile/controllers/language_controller.dart';
import 'package:fiorent_cloud_mobile/screens/home_page.dart';
import 'package:fiorent_cloud_mobile/utils/app_constants.dart';
import 'package:fiorent_cloud_mobile/utils/messages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/dep.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: no_leading_underscores_for_local_identifiers
  Map<String, Map<String, String>> _languages = await dep.init();
  runApp(MyApp(
    languages: _languages,
  ));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String, String>> languages;
  const MyApp({super.key, required this.languages});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
        builder: (localizationController) {
      return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          locale: localizationController.locale,
          translations: Messages(languages: languages),
          fallbackLocale: Locale(AppConstants.languages[0].languageCode,
              AppConstants.languages[0].countryCode),
          home: const LoginPage());
    });
  }
}
