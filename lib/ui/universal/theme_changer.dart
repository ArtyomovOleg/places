import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier, DiagnosticableTreeMixin {
  ThemeMode themeMode = ThemeMode.light;

  ThemeChanger();

  getThemeMode() => themeMode;

  change() {
    themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;

    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('themeMode', themeMode.toString()));
  }
}
