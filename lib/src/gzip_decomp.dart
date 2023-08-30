import 'dart:convert';
import 'dart:io';

import 'dart:typed_data';

import 'package:intl/intl.dart';

class Decomp {
  static String decompress(String zipText) {
    final decodeBase64Json = base64Decode(zipText);
    final decodedData =  GZipCodec().decode(decodeBase64Json);
    Uint8List bytes = Uint8List.fromList(decodedData);
    final utf16CodeUnits = bytes.buffer.asUint16List();
    final str = String.fromCharCodes(utf16CodeUnits);
    return str;
  }
}