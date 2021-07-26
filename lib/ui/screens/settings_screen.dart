import 'package:flutter/material.dart';
import 'package:places/ui/screens/res/text_styles.dart';

import 'package:provider/provider.dart';
import 'package:flutter_svg/svg.dart';

import 'package:places/ui/universal/theme_changer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool darkTheme;

  @override
  Widget build(BuildContext context) {
    final ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);
    darkTheme = _themeChanger.getThemeMode() == ThemeMode.dark ? true : false;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        title: Text('Настройки', style: settingsTopTitle(context)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Тёмная тема',
                style: settingsTitle(context),
              ),
              trailing: Switch.adaptive(
                value: darkTheme,
                onChanged: (value) {
                  setState(() {
                    darkTheme = value;
                    _themeChanger.change();
                  });
                },
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                'Смотреть туториал',
                style: settingsTitle(context),
              ),
              trailing: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  'assets/icons/info.svg',
                  width: 24,
                  height: 24,
                  color: Theme.of(context).buttonTheme.colorScheme?.background,
                ),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
