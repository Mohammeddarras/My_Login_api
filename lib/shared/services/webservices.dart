
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_login_api/shared/Constant/constant.dart';


class WebServices {

  // Future<Map<String,dynamic>> getHome() async{
  //   final response = await _get(action: "get_home",);
  //   var jsonResponse = jsonDecode(response!.body);
  //
  //   return {
  //     "Category": List<DataCategory>.from(jsonResponse!['data']['categories'].map((e) => DataCategory.fromJson(e)) ?? []),
  //   };
  // }



  Future<http.Response?> _get({
    required final String action,
    final Map<String, dynamic> queryParams =
    const {},
  }) async {
    final param = {
      ...queryParams,
    };
    try {
      final response = await http.get(
       param.isNotEmpty ? Uri.parse("$IPTest$action").replace(queryParameters: param) : Uri.parse("$IPTest$action"),
      );
      printLog('[GET REQUEST][$response]');
      return response;
    } catch (e) {
      return _get(action: action, queryParams: queryParams);
    }
  }

  Future<http.Response?> _post({
    required final String action,
    final Map<String, dynamic> queryParams = const {},
  }) async {
    final param = {
      ...queryParams,
    };

    try {
      final response = await http.post(
        Uri.parse('$IP$action'),
        body: param,
      );
      printLog('[POST REQUEST][$response]');
      return response;
    } catch (e) {
      return _post(action: action, queryParams: queryParams);
    }
  }

}