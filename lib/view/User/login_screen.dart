import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:my_login_api/shared/Config/index.dart';
import 'package:my_login_api/view/User/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'JO';

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.lightBlue[800],
                      borderRadius:const BorderRadius.only(
                          bottomLeft: Radius.circular(70),
                          bottomRight: Radius.circular(70))),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///title Screen
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          "LOGIN_SCREEN".tr,
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  ///TextField
                  SingleChildScrollView(
                    child: ClipRRect(
                      borderRadius:const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.8,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration:const BoxDecoration(color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: kPadding),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.height / 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lightBlue[800]),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: IntlPhoneField(
                                autovalidateMode: AutovalidateMode.disabled,
                                decoration: InputDecoration(
                                  hintText: 'phone_number'.tr,
                                  contentPadding: const EdgeInsets.only(top: kPadding / 1.1),
                                  counter: const SizedBox(),
                                ),
                                initialCountryCode: 'JO',
                                onChanged: (phone) {
                                  print(phone.completeNumber); //get complete number
                                  print(phone.countryCode); // get country code only
                                  print(phone.number); // only phone number
                                },
                              ),
                            ),
                            Padding(
                              padding:const EdgeInsets.all(8),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: Colors.lightBlue[800],
                                    ),
                                    labelText: "password".tr),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FlatButton(onPressed: () {}, child: Text("forget_password".tr))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 1.4 * (MediaQuery.of(context).size.height / 20),
                                  width: 5 * (MediaQuery.of(context).size.width / 10),
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: RaisedButton(
                                    elevation: 5.0,
                                    color: Colors.lightBlue[800],
                                    onPressed: () {},
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30)),
                                    child: Text(
                                      "login".tr,
                                      style: TextStyle(
                                          color: Colors.white,
                                          letterSpacing: 0.5,
                                          fontSize:
                                          MediaQuery.of(context).size.height / 40),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  child: Text(
                                    "-or-".tr,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400, fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.lightBlue[800],
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              offset: Offset(0, 2),
                                              blurRadius: 6)
                                        ]),
                                    child: Icon(
                                      FontAwesomeIcons.google,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  ///Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 1),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(RegisterScreen());
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'don\'t_have_an_account? '.tr,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: MediaQuery.of(context).size.height / 40,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextSpan(
                                  text: 'sign_up '.tr,
                                  style: TextStyle(
                                    color: Colors.lightBlue[800],
                                    fontSize: MediaQuery.of(context).size.height / 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}
