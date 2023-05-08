import 'package:fiorent_cloud_mobile/controllers/language_controller.dart';
import 'package:fiorent_cloud_mobile/model/language_model.dart';
import 'package:fiorent_cloud_mobile/utils/app_constants.dart';
import 'package:flutter/material.dart';

class LanguageWidget extends StatelessWidget {
  final LanguageModel languageModel;
  final LocalizationController localizationController;
  final int index;
  const LanguageWidget(
      {super.key,
      required this.languageModel,
      required this.localizationController,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        localizationController.setLanguage(Locale(
            AppConstants.languages[index].languageCode,
            AppConstants.languages[index].countryCode));
        localizationController.setSelectIndex(index);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey[200]!, blurRadius: 3, spreadRadius: 1)
            ]),
        child: Stack(
          children: [
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  Image.asset("assets/images/${languageModel.imageUrl}", height: 20,),
                  const SizedBox(width: 10),
                  Text(languageModel.languageName)
                ],
              ),
            ),
            localizationController.selectedIndex == index
                ? const Positioned(
                    top: 0,
                    right: 0,
                    left: 120,
                    bottom: 0,
                    child: Icon(
                      Icons.check_circle,
                      size: 10,
                    ))
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
