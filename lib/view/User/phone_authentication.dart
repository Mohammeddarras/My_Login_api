import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:my_login_api/shared/Constant/constant.dart';
import 'package:my_login_api/shared/utils/text_utils.dart';
import 'package:my_login_api/shared/utils/utils.dart';

class PhoneAuthentication{
  static PhoneAuthentication? _instance;

  static const Duration kTimeoutDuration = Duration(minutes: 1);

  PhoneAuthentication._();

  factory PhoneAuthentication() => _instance ??= PhoneAuthentication._();

  int? _resendToken;
  String? _verificationToken;
  FirebaseAuth auth = FirebaseAuth.instance;

  void sendCode({
  required final String mobile,
  required final String countryCode,
  final Function? onCodeSent,
  final PhoneVerificationFailed? onVerificationFailed,
  final Function(String? smsCode)? onVerified,
}) async {
    auth.verifyPhoneNumber(
        phoneNumber: '$countryCode$mobile',
        forceResendingToken: _resendToken,
        timeout: kTimeoutDuration,
        verificationCompleted: (PhoneAuthCredential credential) async {
          printLog("verificationCompleted :: ${credential.smsCode}");
          _resendToken = null;
          _verificationToken = null;
          onVerified?.call(credential.smsCode);
        },
        verificationFailed: (FirebaseAuthException e){
          printLog("verificationFailed :: ${e.message}");
          Utils.displayError(title: "phone_authentication".tr,message: e.message);
          onVerificationFailed?.call(e);
        },
        codeSent: (String verificationId, int? resendToken){
          printLog("onCodeSent");
          onCodeSent?.call();
          _verificationToken = verificationId;
          _resendToken = resendToken;
        },
        codeAutoRetrievalTimeout: (String verificationId){},
    );
}

Future<bool> checkCode(final String code) async{
    if(TextUtils.isEmpty(code)) return false;
    if(TextUtils.isEmpty(_verificationToken)) return false;
    final credential = PhoneAuthProvider.credential(verificationId: _verificationToken!, smsCode: code);

    UserCredential? user;

    try{
      user = await auth.signInWithCredential(credential);
    }catch (e){
      return false;
    }

    if(user.user?.uid == null) return false;

    return true;
}

}