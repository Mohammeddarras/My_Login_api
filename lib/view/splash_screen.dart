import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_login_api/view/User/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {
    Future.delayed(const Duration(milliseconds: 5000),(){
      Get.off(LoginScreen());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset("assets/images/user.png",width: 250,height: 250,),
      ),
    );
  }
}
