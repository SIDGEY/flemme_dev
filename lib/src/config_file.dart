import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlemmeConfig {
  static final FlemmeConfig _singleton = FlemmeConfig._internal();

  factory FlemmeConfig() {
    return _singleton;
  }

  FlemmeConfig._internal() {}

  EdgeInsets paddingAllSM = const EdgeInsets.all(4);
  EdgeInsets paddingAllS = const EdgeInsets.all(8);
  EdgeInsets paddingAllM = const EdgeInsets.all(12);
  EdgeInsets paddingAllL = const EdgeInsets.all(20);
  EdgeInsets paddingAllXL = const EdgeInsets.all(32);

  Color modalBackgroundColors = Colors.transparent;
}
