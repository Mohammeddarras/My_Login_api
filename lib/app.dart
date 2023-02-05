import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_login_api/shared/Config/index.dart';
import 'package:my_login_api/shared/Constant/localization_string.dart';
import 'package:my_login_api/shared/widgets/save_button.dart';
import 'package:my_login_api/view/splash_screen.dart';
import 'controller/app.dart';


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  final _app = Get.find<AppController>(tag: 'app_controller');

  @override
  void initState() {
    checkConnectivity();
    super.initState();
  }

  void checkConnectivity() async{
    final result = await Connectivity().checkConnectivity();
  }

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
        translations: LocalizationString(),
        locale: _app.locale,
        debugShowCheckedModeBanner: false,
        title: "Training Centers",

        home: StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context,snapshot){
            return snapshot.data == ConnectivityResult.none ?
            AlertDialog(
              title: Center(child: Text("No Internet")),
              content: Text("disconnect Internet"),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SaveButton(onPressed: (){},),
                    const SizedBox(width: kPadding / 2,),
                    SaveButton(onPressed: (){},),
                  ],
                ),
              ],)
            : SplashScreen();
          },
        )
    );
  }
}


