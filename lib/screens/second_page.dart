import 'package:fiorent_cloud_mobile/xelauikit/models/xela_button_models.dart';
import 'package:fiorent_cloud_mobile/xelauikit/models/xela_checkbox_models.dart';
import 'package:fiorent_cloud_mobile/xelauikit/xela_button.dart';
import 'package:fiorent_cloud_mobile/xelauikit/xela_checkbox.dart';
import 'package:fiorent_cloud_mobile/xelauikit/xela_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/second_page_controller.dart';
import '../xelauikit/xela_textfield.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final SecondPageController secondPageController =
      Get.put(SecondPageController());
  TextEditingController dateInputController = TextEditingController();
  final bool _isDark = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      body: SizedBox(
          width: Get.size.width,
          height: Get.size.height,
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                XelaTextField(
                  borderRad: 0,
                  textEditingController:
                      secondPageController.teslimSorumlusuController,
                  placeholder: "Teslimat Sorumlusu Giriniz".tr,
                ),
                const SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: Colors.white, width: 2)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                  iconSize: 30,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  onChanged: (s) {},
                  hint: Text("Varış İli seçiniz".tr),
                  items: const [
                    DropdownMenuItem(value: '2', child: Text('Ankara')),
                    DropdownMenuItem(value: '3', child: Text('Antalya')),
                    DropdownMenuItem(value: '1', child: Text('İstanbul')),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(color: Colors.white, width: 2)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 1),
                    ),
                  ),
                  iconSize: 30,
                  style: const TextStyle(color: Colors.black, fontSize: 18),
                  onChanged: (s) {},
                  hint: Text("Varış İlçesi seçiniz".tr),
                  items: const [
                    DropdownMenuItem(value: '2', child: Text('Ankara')),
                    DropdownMenuItem(value: '3', child: Text('Antalya')),
                    DropdownMenuItem(value: '1', child: Text('İstanbul')),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Tarih'.tr,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 1)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 1)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2)),
                  ),
                  controller: dateInputController,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2050));

                    if (pickedDate != null) {
                      dateInputController.text =
                          DateFormat('dd MMMM yyyy').format(pickedDate);
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: secondPageController.aracSayisiController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1)),
                      labelText: 'Araç Sayısı'.tr,
                      labelStyle:
                          const TextStyle(color: Color.fromARGB(255, 100, 100, 100))),
                ),
                /*XelaTextField(
                  textEditingController:
                      secondPageController.teslimSorumlusuController,
                  placeholder: "Araç Sayısı Giriniz",
                  keyboardType: TextInputType.number,
                ),*/
                const SizedBox(
                  height: 15,
                ),
                XelaTextField(
                  borderRad: 0,
                  textEditingController:
                      secondPageController.teslimSorumlusuController,
                  placeholder: "Araç Fiyatı Giriniz".tr,
                  keyboardType: TextInputType.number,
                ),
                /*const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: secondPageController.aracFiyatiController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide:
                              const BorderSide(color: Colors.white, width: 1)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 1)),
                      
                      labelText: 'Araç Fiyatı',
                      labelStyle: const TextStyle(color: Colors.black)),
                ),*/
                const SizedBox(
                  height: 35,
                ),
                XelaCheckbox(
                    checkboxIcon: const Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                    label: "Onaya gitsin mi?".tr,
                    size: XelaCheckboxSize.SMALL,
                    selectedColor: _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                    defaultColor: _isDark ? XelaColor.Gray4 : XelaColor.Gray4,
                    valueColor: _isDark ? XelaColor.Red5 : XelaColor.Red3,
                    labelColor: _isDark ? XelaColor.Gray11 : XelaColor.Gray5,
                    captionColor: _isDark ? XelaColor.Gray6 : XelaColor.Gray8,
                    disabled: false),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    XelaButton(
                      onPressed: () {Navigator.pop(context);},
                      text: "İptal".tr,
                      type: XelaButtonType.PRIMARY,
                      size: XelaButtonSize.LARGE,
                      background: _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      foregroundColor: Colors.white,
                    ),
                    const SizedBox(width: 15),
                    XelaButton(
                      onPressed: () {},
                      text: "Kaydet".tr,
                      type: XelaButtonType.PRIMARY,
                      size: XelaButtonSize.LARGE,
                      background: _isDark ? XelaColor.Blue5 : XelaColor.Blue3,
                      foregroundColor: Colors.white,
                    ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
