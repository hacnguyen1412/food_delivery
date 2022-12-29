import 'dart:io';

import 'package:core_dependency/core_dependency.dart';

class AppDirectory {
  final Directory dir;

  AppDirectory._(this.dir);

  static Future<AppDirectory> getInstance() async {
    final dir = await getApplicationDocumentsDirectory();
    return AppDirectory._(dir);
  }
}
