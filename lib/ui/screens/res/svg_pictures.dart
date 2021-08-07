import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

final Map<String, String> iconPaths = {
  'ListFill': 'assets/icons/list_fill.svg',
  'ListOutline': 'assets/icons/list_outline.svg',
  'HeartFill': 'assets/icons/heart_checked.svg',
  'HeartOutline': 'assets/icons/heart_unchecked.svg',
  'SettingsFill': 'assets/icons/settings_fill.svg',
  'SettingsOutline': 'assets/icons/settings_outline.svg',
  'CalendarFill': 'assets/icons/calendar_fill.svg',
  'CalendarOutline': 'assets/icons/calendar_outline.svg',
};

class SvgIcon extends StatelessWidget {
  final BuildContext context;
  final String iconName;
  final Color? color;

  const SvgIcon(this.context, this.iconName, {Key? key, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      getIconPath(iconName),
      color: color ?? Theme.of(context).buttonTheme.colorScheme?.primary,
      width: 24,
      height: 24,
    );
  }

  String getIconPath(String iconName) {
    return iconPaths[iconName] ?? 'assets/icons/info.svg';
  }
}
