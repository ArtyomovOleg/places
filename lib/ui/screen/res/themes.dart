import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.light(),
  textTheme: const TextTheme(
    headline1: lightHeadline1,
    headline2: textWithoutStyle,
    headline3: textWithoutStyle,
    headline4: textWithoutStyle,
    headline5: textWithoutStyle,
    headline6: textWithoutStyle,
    subtitle1: textWithoutStyle,
    subtitle2: textWithoutStyle,
    bodyText1: textWithoutStyle,
    bodyText2: textWithoutStyle,
    caption: textWithoutStyle,
    button: textWithoutStyle,
    overline: textWithoutStyle,
  ),
);

final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.dark(),
  scaffoldBackgroundColor: Color(0xFFb21222C),
  textTheme: const TextTheme(
    headline1: darkHeadline1,
    headline2: textWithoutStyle,
    headline3: textWithoutStyle,
    headline4: textWithoutStyle,
    headline5: textWithoutStyle,
    headline6: textWithoutStyle,
    subtitle1: textWithoutStyle,
    subtitle2: textWithoutStyle,
    bodyText1: textWithoutStyle,
    bodyText2: textWithoutStyle,
    caption: textWithoutStyle,
    button: textWithoutStyle,
    overline: textWithoutStyle,
  ),
);

const TextStyle textWithoutStyle = TextStyle(
  color: Colors.deepOrange,
  backgroundColor: Colors.redAccent,
  decorationColor: Colors.red,
);

const TextStyle lightHeadline1 = TextStyle(
  color: Color(0xFF3B3E5B),
  fontSize: 32.0,
  height: 1.12,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.bold,
);

const TextStyle darkHeadline1 = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: 32.0,
  height: 1.12,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.bold,
);
