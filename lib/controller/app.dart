import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../shared/Config/index.dart';
import '../shared/utils/preferences_manager.dart';

class AppController extends GetxController {
  final RxString _lang = RxString(kDefaultLanguage);

  @override
  void onInit() {
    _lang(PreferencesManager.getString('app_lang', kDefaultLanguage));
    Get.updateLocale(Locale(_lang.value));

    super.onInit();
  }

  void changeLanguage(final String toLanguage) async {
    print('CHANGE LANGUAGE TO :$toLanguage');
    PreferencesManager.setString('app_lang', toLanguage);
    _lang(toLanguage);
    Get.updateLocale(Locale(toLanguage));
  }

  Locale get locale => Get.locale ?? const Locale('en');
  // String get language => _lang.value;
}
