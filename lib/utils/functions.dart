import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

class Functions {
  static String formatTime(int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var hours = (secs ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }

  static String hashing(String inputStr) {
    var bytes = utf8.encode(inputStr); // data being hashed
    var digest = sha1.convert(bytes);
    return digest.toString();
  }

  static uniqueIDGenerator() {
    Random rnd = Random();
    int max = 9999999;
    int min = 1000000;
    Random rnd2 = Random(DateTime.now().millisecondsSinceEpoch);
    int r2 = min + rnd2.nextInt(max - min);
    return r2;
    // return _now.toString()
  }
}
