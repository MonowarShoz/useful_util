import 'dart:convert';

import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:useful_util/src/gzip_decomp.dart';

class CodeUtil {
  static String convertToBase64(dynamic data) {
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

   static Future urlOrPhoneLauncher({String? uriName, bool isPhone = false}) async {
    Uri? uriSearch;
     String infoLink = 'http://$uriName';// 'http://google.com/';
    uriSearch = isPhone ? Uri.tryParse('tel:+8801615-720012') : Uri.tryParse(infoLink);
    if (await launchUrl(uriSearch!)) {
      await launchUrl(uriSearch, mode: LaunchMode.platformDefault);
    } else {
      throw 'Could not launch $uriSearch';
    }
  }
  static Map convertPayload(String payload) {
    final String _payload = payload.substring(1, payload.length - 1);
    List<String> _split = [];
    _payload.split(",")..forEach((String s) => _split.addAll(s.split(":")));
    Map _mapped = {};
    for (int i = 0; i < _split.length + 1; i++) {
      if (i % 2 == 1) _mapped.addAll({_split[i - 1].trim().toString(): _split[i].trim()});
    }
    return _mapped;
  }

  static String decompr(String txt) {
    return Decomp.decompress(txt);
  }
}