import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:places/ui/universal/theme_changer.dart';
import 'ui/screens/sight_list_screen.dart';
import 'ui/screens/res/themes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeChanger(),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places',
      home: SightListScreen(),
      themeMode: context.watch<ThemeChanger>().themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
