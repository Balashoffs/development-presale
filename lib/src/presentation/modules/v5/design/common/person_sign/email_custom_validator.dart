import 'package:flutter/material.dart';

class EmailCustomValidator {
  final TextEditingController _jobEmailController = TextEditingController();

  TextEditingController get jobEmailController => _jobEmailController;

  set text(String value) {
    _jobEmailController.text = value;
  }

  String emailSuffix = '';
  bool _isInternalUpdate = false;

  EmailCustomValidator() {
    _jobEmailController.addListener(_handleTextChange);
  }

  void dispose() {
    _jobEmailController.dispose();
  }

  void _handleTextChange() {
    if (_isInternalUpdate) return;

    String currentText = _jobEmailController.text;
    String userInput = currentText;

    if (currentText.endsWith(emailSuffix)) {
      userInput = currentText.substring(
        0,
        currentText.length - emailSuffix.length,
      );
    }

    String newText = userInput + emailSuffix;

    if (newText != currentText) {
      _isInternalUpdate = true;

      jobEmailController.value = TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: userInput.length),
      );

      _isInternalUpdate = false;
    }
  }
}
