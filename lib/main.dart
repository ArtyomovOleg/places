import 'package:flutter/material.dart';

import 'package:places/ui/screen/visiting_screen.dart';
import 'ui/screen/sight_list_screen.dart';
import 'ui/screen/res/themes.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Places',
      home: SightListScreen(),
      // home: VisitingScreen(),
      themeMode: ThemeMode.dark,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
