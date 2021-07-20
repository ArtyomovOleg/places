import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

TextStyle filtersTitle(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).buttonColor,
    fontSize: 16.0,
    height: 1.25,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
  );
}

final TextStyle filtersDistance = TextStyle(
  color: Color(0xFF7C7E92),
  fontSize: 16.0,
  height: 1.25,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
);

final TextStyle filterShowButton = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: 14.0,
  height: 1.28571,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.bold,
  fontStyle: FontStyle.normal,
  decoration: TextDecoration.none,
);
