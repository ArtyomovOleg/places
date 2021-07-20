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

const TextStyle filtersDistance = TextStyle(
  color: Color(0xFF7C7E92),
  fontSize: 16.0,
  height: 1.25,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
);

const TextStyle filterShowButton = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: 14.0,
  height: 1.28571,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.bold,
);

TextStyle settingsTitle(BuildContext context) {
  return TextStyle(
    fontSize: 18.0,
    height: 1.33333,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    color: Theme.of(context).buttonColor,
  );
}

TextStyle settingsThemeTitle(BuildContext context) {
  return TextStyle(
    fontSize: 16.0,
    height: 1.25,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: Theme.of(context).buttonColor,
  );
}

TextStyle settingsTutorialTitle(BuildContext context) {
  return TextStyle(
    fontSize: 16.0,
    height: 1.25,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: Theme.of(context).buttonColor,
  );
}

const TextStyle sightCardVisitingTitle = TextStyle(
  color: Color(0xFF4CAF50),
  fontSize: 14.0,
  height: 1.28571,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
);

const TextStyle sightCardVisitingWorkTime = TextStyle(
  color: Color(0xFF7C7E92),
  fontSize: 14.0,
  height: 1.28571,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w400,
);

const TextStyle sightCardVisitingAchieved = TextStyle(
  color: Color(0xFF7C7E92),
  fontSize: 14.0,
  height: 1.28571,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.normal,
);

const TextStyle sightDetailsWorkTime = TextStyle(
  color: Color(0xFF7C7E92),
  fontSize: 14.0,
  height: 1.28571,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.normal,
);

TextStyle sightDetailsTitle(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).textTheme.headline2?.color,
    fontSize: 14.0,
    height: 1.28571,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.normal,
  );
}

const TextStyle sightDetailsPlotACourse = TextStyle(
  color: Color(0xFFFFFFFF),
  fontSize: 14.0,
  height: 1.28571,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.bold,
);

TextStyle sightDetailsButtonShadowed(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).buttonTheme.colorScheme?.secondary,
    fontSize: 14.0,
    height: 1.28571,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
  );
}

TextStyle sightDetailsButtonActive(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).buttonTheme.colorScheme?.primary,
    fontSize: 14.0,
    height: 1.28571,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.bold,
  );
}

TextStyle visitingFavoriteTitle(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).textTheme.headline1?.color,
    fontSize: 18.0,
    height: 1.33333,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
  );
}
