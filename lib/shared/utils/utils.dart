import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:my_login_api/shared/utils/text_utils.dart';

class Utils {

  static void hideKeyboard([final BuildContext? context]){
    FocusScope.of((context ?? Get.context)!).requestFocus(FocusNode());
  }

  static void displayError({final String? title, final String? message}) {
    if (TextUtils.isEmpty(title) && TextUtils.isEmpty(message)) return;

    if(TextUtils.isEmpty(title)) return displayToast(message!);
    if(TextUtils.isEmpty(message)) return displayToast(title!);

    Get.snackbar(title!, message!, snackPosition: SnackPosition.BOTTOM);
  }

  static void displayToast(final String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static bool _loaderShown = false;

  static void displayLoader() {
    if (_loaderShown) return;
    _loaderShown = true;
    Get.dialog(
      WillPopScope(
          child: const Center(
            child: CircularProgressIndicator()),
          onWillPop: () async {
            _loaderShown = false;
            Get.back();
            Get.back();
            return false;
          }),
      barrierDismissible: false,
    );
  }

  static void hideLoader() {
    if (!_loaderShown) return;
    Get.back();
    _loaderShown = false;
  }

}
