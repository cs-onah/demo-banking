import 'package:flutter/foundation.dart';

Logger devLog = Logger.instance;

class Logger {
  ///Singleton Impl
  static final Logger instance = Logger._internal();
  Logger._internal();

  bool showLog = kDebugMode;
  void call(dynamic data1, [dynamic data2]) {
    if (showLog) {
      if (data2 != null) {
        printWrapped("$data1: $data2");
      } else {
        printWrapped("$data1");
      }
    }
  }

  void error(dynamic data, [dynamic data2]) => call("🔴 $data", data2);
  void success(dynamic data, [dynamic data2]) => call("🟢 $data", data2);
  void info(dynamic data, [dynamic data2]) => call("💡 $data", data2);
  void sent(dynamic data, [dynamic data2]) => call("🚀 $data", data2);
}

/// For printing text longer than 800 xters
///
/// By default dart print function can only print 800 xters, but this will print
/// the text on a new line till the text is exhausted.
void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  // ignore: avoid_print
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

/// A top level function to print dio logs
void printDioLogs(Object object) {
  printWrapped(object.toString());
}
