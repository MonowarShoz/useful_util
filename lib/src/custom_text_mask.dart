import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
class SampleTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // Get the current text
    final String newText = newValue.text;

    // We want to format it as NN-NNNN (e.g., 22-1412)
    String formattedText = '';

    // Ensure the length doesn't exceed 6 characters (e.g., 22-1412)
    if (newText.length <= 6) {
      // Add the first two characters (NN)
      if (newText.length >= 2) {
        formattedText += newText.substring(0, 2) + '-';
      } else {
        formattedText += newText.substring(0, newText.length);
      }

      // Add the next four characters (NNNN)
      if (newText.length > 2) {
        formattedText += newText.substring(2, 6);
      }
    } else {
      // If the text is longer than 6 characters, truncate it
      formattedText = newText.substring(0, 6);
    }

    // Return the updated TextEditingValue with the formatted text
    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
var maskFormatter =  MaskTextInputFormatter(
      mask: '##-####', filter: {"#": RegExp(r'[0-9]')});