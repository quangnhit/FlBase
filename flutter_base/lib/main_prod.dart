import 'dart:async';

import 'package:flutter_base/base/base_run_main.dart';
import 'package:flutter_base/config/product.config.dart';

Future<void> main() async {
  BaseRunMain.runMainApp(config: ProductConfig());
}
