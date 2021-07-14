import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:places/ui/screens/res/themes.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool darkTheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 56,
        title: Text(
          'Настройки',
          style: TextStyle(
            fontSize: 18.0,
            height: 1.33333,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            color: Theme.of(context).buttonColor,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Тёмная тема',
                style: TextStyle(
                  fontSize: 16.0,
                  height: 1.25,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).buttonColor,
                ),
              ),
              trailing: Switch.adaptive(
                value: darkTheme,
                onChanged: (value) {
                  setState(() {
                    darkTheme = value;
                  });
                },
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                'Смотреть туториал',
                style: TextStyle(
                  fontSize: 16.0,
                  height: 1.25,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).buttonColor,
                ),
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
