import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SecondPageController extends GetxController {
  final teslimSorumlusuController = TextEditingController();
  final varisIlController = TextEditingController();
  final varisIlceController = TextEditingController();
  final dateinput  = TextEditingController();
  final aracSayisiController = TextEditingController();
  final aracFiyatiController = TextEditingController();

  final teslimSorumlusuFocusNode = FocusNode();
  final varisIlFocusNode = FocusNode();
  final varisIlceFocusNode = FocusNode();
  final teslimTarihiFocusNode = FocusNode();
  final aracSayisiFocusNode = FocusNode();
  final aracFiyatiFocusNode = FocusNode();

  klavyeKapatFunction() {
    teslimSorumlusuFocusNode.unfocus();
    varisIlFocusNode.unfocus();
    varisIlceFocusNode.unfocus();
    teslimTarihiFocusNode.unfocus();
    aracSayisiFocusNode.unfocus();
    aracFiyatiFocusNode.unfocus();
  }
}
