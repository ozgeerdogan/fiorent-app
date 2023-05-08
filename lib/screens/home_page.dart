// ignore_for_file: unused_label

import 'package:fiorent_cloud_mobile/controllers/language_controller.dart';
import 'package:fiorent_cloud_mobile/screens/second_page.dart';
import 'package:fiorent_cloud_mobile/utils/language_widgets.dart';
import 'package:fiorent_cloud_mobile/xelauikit/models/xela_button_models.dart';
import 'package:fiorent_cloud_mobile/xelauikit/xela_button.dart';
import 'package:fiorent_cloud_mobile/xelauikit/xela_color.dart';
import 'package:fiorent_cloud_mobile/xelauikit/xela_text_style.dart';
import 'package:fiorent_cloud_mobile/xelauikit/xela_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final bool _isDark = false;
  bool secureStatus = true;

  var emailController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<LocalizationController>(
        builder: (localizationController) {
          return Scaffold(
            appBar: AppBar(
              title: Text("GİRİŞ SAYFASI".tr),
              actions: [
                PopupMenuButton(
                  itemBuilder: ((context) {
                    return [
                      PopupMenuItem(
                          child: LanguageWidget(
                        index: 0,
                        languageModel: localizationController.language[0],
                        localizationController: localizationController,
                      )),
                      PopupMenuItem(
                          child: LanguageWidget(
                        index: 1,
                        languageModel: localizationController.language[1],
                        localizationController: localizationController,
                      )),
                    ];
                  }),
                  icon: const Icon(Icons.language),
                )
              ],
            ),
            body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          const SizedBox(height: 100),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // GridView.builder(
                              //   gridDelegate:
                              //       const SliverGridDelegateWithFixedCrossAxisCount(
                              //           crossAxisCount: 2, childAspectRatio: 1),
                              //   itemCount: 2,
                              //   physics: const NeverScrollableScrollPhysics(),
                              //   shrinkWrap: true,
                              //   itemBuilder: (BuildContext context,
                              //           int index) =>
                              //       LanguageWidget(
                              //           languageModel: localizationController
                              //               .language[index],
                              //           localizationController:
                              //               localizationController,
                              //           index: index),
                              // ),
                              Image.asset("assets/images/logo.webp".tr),
                              const SizedBox(
                                height: 40,
                              ),
                              XelaTextField(
                                placeholder: "Kullanıcı Adı".tr,
                                textEditingController: emailController,
                                onChange: (p0) => emailController.text = p0,
                                background:
                                    _isDark ? Colors.transparent : Colors.white,
                                borderDefaultColor: _isDark
                                    ? XelaColor.Gray4
                                    : XelaColor.Gray11,
                                placeholderColor:
                                    _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                                textfieldColor: _isDark
                                    ? XelaColor.Gray11
                                    : XelaColor.Gray2,
                                borderFocusColor:
                                    _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                                defaultHelperTextColor:
                                    _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              XelaTextField(
                                placeholder: "Parola".tr,
                                onChange: (p0) => passController.text = p0,
                                secureField: secureStatus,
                                background:
                                    _isDark ? Colors.transparent : Colors.white,
                                borderDefaultColor: _isDark
                                    ? XelaColor.Gray4
                                    : XelaColor.Gray11,
                                placeholderColor:
                                    _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                                textfieldColor: _isDark
                                    ? XelaColor.Gray11
                                    : XelaColor.Gray2,
                                borderFocusColor:
                                    _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                                defaultHelperTextColor:
                                    _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                                rightIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        secureStatus = !secureStatus;
                                      });
                                    },
                                    child: Icon(
                                        (secureStatus)
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        size: 15,
                                        color: XelaColor.Gray7)),
                              ),
                              const SizedBox(height: 35),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  "Parolanızı mı unuttunuz?".tr,
                                  style: XelaTextStyle.XelaButtonMedium.apply(
                                      color: Colors.blue),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 12),
                                child: XelaButton(
                                  onPressed: () {
                                    //login();
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SecondPage()));
                                  },
                                  text: "GİRİŞ".tr,
                                  type: XelaButtonType.PRIMARY,
                                  size: XelaButtonSize.MEDIUM,
                                  background: Colors.blue,
                                  foregroundColor: Colors.white,
                                  autoResize: false,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 20),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            "Yeni kullanıcı? Hesap oluşturun".tr,
                            style: XelaTextStyle.XelaSmallBody.apply(
                                color: _isDark
                                    ? XelaColor.Gray11
                                    : XelaColor.Gray2),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }

  Future<void> login() async {
    if (passController.text.isNotEmpty && emailController.text.isNotEmpty) {
      // ignore: unused_local_variable
      var response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: ({
            "email": emailController.text,
            "password": passController.text
          }));
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SecondPage()));
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Invalid")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Black field")));
    }
  }
}
