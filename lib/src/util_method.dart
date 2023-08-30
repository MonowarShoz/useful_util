import 'dart:convert';

import 'dart:typed_data';

import 'package:crypto/crypto.dart';

import 'package:intl/intl.dart';
import 'package:useful_util/src/gzip_decomp.dart';

class CodeUtil {
  static String convertToBase64(var data) {
    String encodedJson = jsonEncode(data);
    var jsonEncodedByte = utf8.encode(encodedJson);
    return base64Encode(jsonEncodedByte);
  }

  static String encodedtoMd5Password(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  static String addDashes(String text) {
    const int addDashEvery = 2;
    String out = '';

    for (int i = 0; i < text.length; i++) {
      if (i + 1 > addDashEvery && i % addDashEvery == 0) {
        out += '-';
      }

      out += text[i];
    }

    return out;
  }
    static String idDash(String str) {
    return '${str.substring(0, 2)}-${str.substring(3, 6)}-${str.substring(6, 8)}';
  }

  static String? numberFormatInt(var number) {
    var formatterInt = NumberFormat('#,###,###,#00');
    return formatterInt.format(number);
  }

  static String decompr(String txt) {
    return Decomp.decompress(txt);
  }
}