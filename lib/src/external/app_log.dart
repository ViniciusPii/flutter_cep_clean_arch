import 'dart:convert';
import 'dart:developer';

import 'package:flutter_arch/src/external/app_client_response.dart';

class AppLog {
  AppLog._();

  static showLog(AppClientResponse response) {
    var logMessage = StringBuffer();
    logMessage.write('-------------\n');
    if (response.data != null && response.data.isNotEmpty) {
      logMessage.write('Data:\n${const JsonEncoder.withIndent(' ').convert(response.data)}\n');
      logMessage.write('-------------\n');
    }
    if (response.errorType != null) {
      logMessage.write('Error Type: ${response.errorType}\n');
      logMessage.write('-------------\n');
    }
    logMessage.write('Message: ${response.message}\n');
    logMessage.write('-------------\n');
    if (response.statusCode != null) {
      logMessage.write('Status code: ${response.statusCode}\n');
      logMessage.write('-------------\n');
    }

    log(logMessage.toString());
  }
}
