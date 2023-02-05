import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:my_login_api/shared/Constant/constant.dart';

class SaveButton extends StatefulWidget {
  VoidCallback onPressed;
  SaveButton({Key? key,required this.onPressed}) : super(key: key);

  @override
  _SaveButtonState createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: kBlackColor,
        ),
        onPressed: widget.onPressed,
        child: Text("save_data".tr,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
      ),
    );
  }
}
