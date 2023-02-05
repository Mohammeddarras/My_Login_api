//
//
// import 'dart:convert';
//
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class UserController extends GetxController{
//   Rxn<MyUser> _user = Rxn<MyUser>();
//
//   @override
//   void onInit() {
//
//     final user = preferencesManager().getString("user_object");
//     if (TextUtils.isEmpty(user)) return;
//     Future.delayed(Duration.zero,(){
//       _user(MyUser.fromJson(jsonDecode(user!)));
//     });
//
//     super.onInit();
//   }
//
//   Future login(final String mobile ,final String password ,final String countryCode) async{
//     final response = await Webservices().login(mobile : mobile , password : password, countryCode : countryCode);
//
//     if(response == null) return;
//     _saveToPreferences(response);
//     Get.offAll(() => const HomeScreen());
// }
//
//   Future updateProfileImage() async{
//     final file = await pickFile();
//     if(file == null) return;
//     await Future.delayed(Duration.zero);
//     await updateProfile(name : user!.name ,mobileNumber : user!.mobile , image : file);
// }
//
//   Future register(final String name ,final String userName ,final String mobile ,
//   final String password , final String countryCode) async{
//     final response = await Webservices().register(name ,userName ,mobile ,password ,countryCode);
//
//     if(response == null) return;
//     _saveToPreferences(response);
//     Get.offAll(() => const HomeScreen());
//   }
//
//   Future updateProfile({required final String name ,final String? mobileNumber , final File? image}) async{
//     final response = await Webservices().updateProfile(name : name,mobileNumber : mobileNumber , profileImage : image);
//
//     if(response == null) return;
//     _saveToPreferences(response);
//     Get.offAll(() => const HomeScreen());
//   }
//
//   Future resetPassword(String mobile ,String countryCode) async{
//     final response = await Webservices().resetPassword(mobile , countryCode);
//
//     if(response == null) return;
//
//     final int userID = int.parse('${response['user_id']}');
//     final String resendPasswordToken = response['token'];
//
//     final verified = await Get.to(() => OtpScreen(
//       userID: userID,
//       mobileNumber: mobile,
//       countryCode: countryCode,
//       resendPasswordToken: resendPasswordToken,
//     ));
//
//    if(verified ?? false){
//      Get.to(() => PasswordConfirmation(
//        userID: userID,
//        resendPasswordToken: resendPasswordToken,
//      ));
//    }
//
//   }
//
//   Future socialLogin(final User? user,final String source) async {
//     if(user == null) return;
//     final response = await Webservices().login(
//         uid : user.uid ,
//         name : user.displayName ?? '',
//         source : source,
//     );
//
//     if(response == null) return;
//     _saveToPreferences(response);
//     Get.offAll(() => const HomeScreen());
//   }
//
//   void _saveToPreferences(final data){
//     printLog('SAVING $data IN USER OBJECT');
//     PreferencesManager().setString("user_object", jsonEncode(data));
//     PreferencesManager().setString("user_token", data['token']);
//     _user(MyUser.fromJson(data));
//   }
//
//   void logout() async{
//     final preferences = await SharedPreferences.getInstance;
//     preferences.remove('user_object');
//     _user = Rxn<MyUser>();
//     Get.offAll(() => const LoginScreen());
//   }
//
//   bool get isLoggedIn => user != null;
//
//   MyUser? get user => _user.value;
//
//   String? get token =>PreferencesManager().getString('user_object');
//
// }