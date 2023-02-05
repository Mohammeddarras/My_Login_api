import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_login_api/app.dart';
import 'package:my_login_api/controller/app.dart';
import 'package:my_login_api/shared/utils/preferences_manager.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await PreferencesManager().initialize();
  Get.put(AppController(), tag: 'app_controller');

  runApp(MyApp());
}



