import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:my_login_api/shared/utils/utils.dart';
import 'package:my_login_api/view/User/phone_authentication.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  final String mobileNumber;
  final String countryCode;
  final int userID;
  final String resendPasswordToken;
  final Function? onVerified;

  const OtpScreen({Key? key,
    required this.mobileNumber,
    required this.countryCode,
    required this.userID,
    required this.resendPasswordToken,
    this.onVerified,
  }) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {

 final otpController = TextEditingController();
 final PhoneAuthentication _authentication = PhoneAuthentication();

 bool timeOut = true, _isLoading = false, loading = false;

 @override
  void initState() {
    Future.delayed(Duration.zero, send);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

   final defaultPinTheme = PinTheme(
     width: 56,
     height: 56,
     textStyle: const TextStyle(fontSize: 20,color: Colors.green),
     decoration: BoxDecoration(
       border: Border.all(color: const Color.fromRGBO(234, 239, 243, 0.9)),
       borderRadius: BorderRadius.circular(20),
     ),
   );

   final focusedPinTheme = defaultPinTheme.copyDecorationWith(
     border: Border.all(color: const Color.fromRGBO(114, 178, 238, 0.5)),
     borderRadius: BorderRadius.circular(8),
   );

   final submittedPinTheme = defaultPinTheme.copyWith(
     decoration: defaultPinTheme.decoration?.copyWith(
       color: const Color.fromRGBO(234, 239, 243, 1),
     ),
   );

    return Scaffold(
      backgroundColor: Colors.grey,
      body: LoadingOverlay(
        progressIndicator: const CircularProgressIndicator(),
       isLoading: loading,
       child: SingleChildScrollView(
         keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
         child: Container(
           padding: const EdgeInsets.symmetric(horizontal: 20),
           height: MediaQuery.of(context).size.height,
           width: double.infinity,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Stack(
                 alignment: Alignment.center,
                 children: [
                   const SizedBox(width: double.maxFinite,),
                   PositionedDirectional(
                     start: 16.0,
                     top: 16.0,
                     child: IconButton(
                       onPressed: () => Get.back(),
                       icon: const Icon(Icons.arrow_back,
                       color: Colors.green,
                       size: 30,),
                     ),
                   ),
                   SizedBox(height: 150,
                   child: Image.asset("assets/images/logo.png"),
                   ),
                 ],
               ),
               const SizedBox(height: 30,),
               FadeInDown(
               duration:const Duration(milliseconds: 500) ,
                 child: Text("verification".tr,style:const TextStyle(
                   fontSize: 30,
                   fontWeight: FontWeight.bold,
                 ),),
               ),
               const SizedBox(height: 30,),
               FadeInDown(
                 delay: const Duration(milliseconds: 500),
                 duration:const Duration(milliseconds: 500) ,
                 child: Text("please_enter_the_6_digits".trArgs(["${widget.countryCode}${widget.mobileNumber}"]),style: TextStyle(
                   fontSize: 16,
                   color: Colors.grey.shade500,
                   height: 1.5,
                 ),),
               ),
               const SizedBox(height: 30,),
               FadeInDown(
                 delay: const Duration(milliseconds: 500),
                 duration:const Duration(milliseconds: 500) ,
                 child: Directionality(
                   textDirection: TextDirection.ltr,
                   child: Pinput(
                     defaultPinTheme: defaultPinTheme,
                     focusedPinTheme: focusedPinTheme,
                     submittedPinTheme: submittedPinTheme,
                     controller: otpController,
                     showCursor: true,
                     onCompleted: checkCode,
                     length: 6,
                   ),
                 ),
               ),
               const SizedBox(height: 30,),
               FadeInDown(
                 delay: const Duration(milliseconds: 500),
                 duration:const Duration(milliseconds: 500) ,
                 child: Row(
                   children: [
                     Text("didn't_receive_otp".tr,style: TextStyle(
                       fontSize: 14,
                       color: Colors.grey.shade500,
                     ),),
                     TextButton(
                       onPressed: timeOut ? send : null,
                       child: Text("resend".tr,style: TextStyle(
                         color: timeOut ? Colors.blueGrey: Colors.grey,
                       ),),
                     ),
                   ],
                 ),
               ),
               const SizedBox(height: 50,),
               FadeInDown(
                 delay: const Duration(milliseconds: 800),
                 duration:const Duration(milliseconds: 500) ,
                 child: MaterialButton(
                   elevation: 0,
                   onPressed: ()=> checkCode(otpController.text),
                   color: Colors.green,
                   minWidth: MediaQuery.of(context).size.width * 0.5,
                   height: 50,
                   child: _isLoading ? const SizedBox(
                     width: 20,
                     height: 20,
                     child: CircularProgressIndicator(
                       backgroundColor: Colors.white,
                       strokeWidth: 3,
                       color: Colors.black,
                     ),
                   ) : Text("verfiy".tr,style: const TextStyle(
                     color: Colors.white,
                   ),),
                 ),
               ),
             ],
           ),
         ),
       ),
      ),
    );
  }

  void checkCode(final String code) async{
   Utils.hideKeyboard(context);

   if(code.length == 6){
     setState(() {
       loading = true;
     });
     if(await _authentication.checkCode(code)){
       onVerified(code);
     } else {
       Utils.displayToast("err_invalid_code".tr);
     }
     setState(() {
       loading = false;
     });
   }
  }

  void onVerified(final String? sms) async{
   if(widget.onVerified == null){
     Get.back(result: true);
   } else {
     await widget.onVerified!.call();
     Get.back();
   }
  }

  void onVerificationFailed(e){
   print("ERROR :: $e");
 }

  void send(){
   if(timeOut){
     setState(() {
       _isLoading = true;
     });
     _authentication.sendCode(
       mobile: widget.mobileNumber,
       countryCode: widget.countryCode,
       onVerified: onVerified,
       onVerificationFailed: onVerificationFailed,
       onCodeSent: (){
         Future.delayed(PhoneAuthentication.kTimeoutDuration, (){
           setState(() {
             timeOut = true;
           });
         });
         timeOut = false;
         setState(() {
           _isLoading = false;
         });
       }
     );
   }
  }

}
