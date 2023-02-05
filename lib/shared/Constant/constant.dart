import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

const kColor = Color(0xFF37C73F);
const kGreyColor = Color(0xFF939191);
const kBlackColor = Color(0xFF101010);


// String IPTest = "https://solar-market.store/api/index.php?action=get_home";
String IPTest = "https://solar-market.store/api/index.php";
String IP = "https://3ajal.com/api/v1";

void printLog(final data){
  if(kReleaseMode) return;
  log("[TESTPROJECT][${DateTime.now()}][$data]");
}

List<String> allTypes = [
  'email',
  'mobile',
  'website',
  'linked_in',
  'facebook',
  'instagram',
  'twitter',
  'youtube',
  'tiktok',
  'snapchat',
  'vimeo'
];


List<String> allTransmissionType = [
  'manual'.tr,
  'automatic'.tr,
];

String description = "برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه برنامج دينار مع قيس المرشد ّ الاقتصاد الرصين بالتعليم والمعرفه الخلاقه";