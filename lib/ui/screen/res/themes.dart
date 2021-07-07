import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.light(),
  primaryColor: const Color(0xFFFFFFFF),
  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
  cardColor: Color(0xFFF5F5F5),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFFFFFFF),
    elevation: 1,
    selectedIconTheme: IconThemeData(color: Color(0xFF252849)),
    unselectedIconTheme: IconThemeData(color: Color(0xFF3B3E5B)),
  ),
  tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      color: Color(0xFF3B3E5B),
    ),
    labelColor: Color(0xFFFFFFFF),
    unselectedLabelColor: Color(0xFF7C7E92),
    labelStyle: TextStyle(
      fontSize: 14.0,
      height: 1.28571,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 14.0,
      height: 1.28571,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: const TextTheme(
    headline1: lightHeadline1,
    headline2: lightHeadline2,
    headline3: lightHeadline3,
    headline4: sightCardTopType,
    headline5: lightHeadline5,
    headline6: textWithoutStyle,
    // subtitle1: textWithoutStyle,
    subtitle2: sightCardBottomText2,
    bodyText1: textWithoutStyle,
    // bodyText2: textWithoutStyle,
    caption: textWithoutStyle,
    button: textWithoutStyle,
    overline: textWithoutStyle,
  ),
);

final ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme.dark(),
  primaryColor: const Color(0xFFb21222C),
  scaffoldBackgroundColor: const Color(0xFFb21222C),
  cardColor: Color(0xFF1A1A20),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFb21222C),
    elevation: 1,
    selectedIconTheme: IconThemeData(color: Color(0xFFFFFFFF)),
    unselectedIconTheme: IconThemeData(color: Color(0xFFF5F5F5)),
  ),
  tabBarTheme: TabBarTheme(
    indicator: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(40)),
      color: Color(0xFFFFFFFF),
    ),
    labelColor: Color(0xFF3B3E5B),
    unselectedLabelColor: Color(0xFF7C7E92),
    labelStyle: TextStyle(
      fontSize: 14.0,
      height: 1.28571,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: TextStyle(
      fontSize: 14.0,
      height: 1.28571,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.bold,
    ),
  ),
  textTheme: const TextTheme(
    headline1: darkHeadline1,
    headline2: darkHeadline2,
    headline3: darkHeadline3,
    headline4: sightCardTopType,
    headline5: darkHeadline5,
    headline6: textWithoutStyle,
    // subtitle1: textWithoutStyle,
    subtitle2: sightCardBottomText2,
    bodyText1: textWithoutStyle,
    // bodyText2: textWithoutStyle,
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

const TextStyle sightCardTopType = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: 14.0,
  height: 1.28571,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.bold,
);

const TextStyle sightCardBottomText2 = TextStyle(
  color: Color(0xFF7C7E92),
  fontSize: 14.0,
  height: 1.28571,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.normal,
);

const TextStyle lightHeadline2 = TextStyle(
  color: Color(0xFF3B3E5B),
  fontSize: 24.0,
  height: 1.20,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
  fontStyle: FontStyle.normal,
  decoration: TextDecoration.none,
);

const TextStyle darkHeadline2 = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: 24.0,
  height: 1.20,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
  fontStyle: FontStyle.normal,
  decoration: TextDecoration.none,
);

const TextStyle lightHeadline3 = TextStyle(
  color: Color(0xFF3B3E5B),
  fontSize: 14.0,
  height: 1.28571,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.normal,
  decoration: TextDecoration.none,
);

const TextStyle darkHeadline3 = TextStyle(
  color: Color(0xFF7C7E92),
  fontSize: 14.0,
  height: 1.28571,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.normal,
  decoration: TextDecoration.none,
);

const TextStyle lightHeadline5 = TextStyle(
  color: Color(0xFF3B3E5B),
  fontSize: 16.0,
  height: 1.25,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);

const TextStyle darkHeadline5 = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: 16.0,
  height: 1.25,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w500,
);
