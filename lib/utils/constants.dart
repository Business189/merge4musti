// ignore_for_file: non_constant_identifier_names, prefer_const_declarations

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

double deviceHeight = Get.size.height;
double deviceWidth = Get.size.width;
String defaultProfilePic =
    "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png";

GetStorage box = GetStorage();
final USERS = "users";
