import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectButton extends StatefulWidget {
  VoidCallback onPressed;
  SelectButton({Key? key,required this.onPressed}) : super(key: key);

  @override
  _SelectButtonState createState() => _SelectButtonState();
}

class _SelectButtonState extends State<SelectButton> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green,
        ),
        onPressed: widget.onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("select".tr,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          ],
        ),
      ),);
  }
}
