import 'package:flutter_base/import.dart';
import 'package:flutter_base/base/base_controller.dart';

class ControlerManager {
  factory ControlerManager() {
    return _singleton;
  }

  ControlerManager._internal();

  static final ControlerManager _singleton = ControlerManager._internal();

  Rx<String> currentController = ''.obs;
}
