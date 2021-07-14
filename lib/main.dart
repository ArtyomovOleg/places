import 'package:flutter/material.dart';

import 'ui/screens/visiting_screen.dart';
import 'ui/screens/sight_list_screen.dart';
import 'ui/screens/res/themes.dart';

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
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
