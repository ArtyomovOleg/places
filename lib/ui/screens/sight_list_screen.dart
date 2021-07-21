import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

import 'package:places/mocks.dart';
import 'package:places/ui/screens/filters_screen.dart';
import 'package:places/ui/screens/settings_screen.dart';
import 'package:places/ui/screens/sight_card.dart';
import 'package:places/ui/screens/visiting_screen.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  int indexBottomNavigationBar = 0;

  @override
  Widget build(BuildContext context) {
    final SvgPicture iconListFill = SvgPicture.asset(
      'assets/icons/list_fill.svg',
      color: Theme.of(context).buttonTheme.colorScheme?.primary,
      width: 24,
      height: 24,
    );

    final SvgPicture iconListOutline = SvgPicture.asset(
      'assets/icons/list_outline.svg',
      color: Theme.of(context).buttonTheme.colorScheme?.primary,
      width: 24,
      height: 24,
    );

    final SvgPicture iconHeartFill = SvgPicture.asset(
      'assets/icons/heart_checked.svg',
      color: Theme.of(context).buttonTheme.colorScheme?.primary,
      width: 24,
      height: 24,
    );

    final SvgPicture iconHeartOutline = SvgPicture.asset(
      'assets/icons/heart_unchecked.svg',
      color: Theme.of(context).buttonTheme.colorScheme?.primary,
      width: 24,
      height: 24,
    );

    final SvgPicture iconSettingsFill = SvgPicture.asset(
      'assets/icons/settings_fill.svg',
      color: Theme.of(context).buttonTheme.colorScheme?.primary,
      width: 24,
      height: 24,
    );

    final SvgPicture iconSettingsOutline = SvgPicture.asset(
      'assets/icons/settings_outline.svg',
      color: Theme.of(context).buttonTheme.colorScheme?.primary,
      width: 24,
      height: 24,
    );

    final List<Widget> _navigationBarScreens = <Widget>[
      ScreenSightList(),
      VisitingScreen(),
      SettingsScreen(),
    ];

    return Scaffold(
      body: _navigationBarScreens[indexBottomNavigationBar],
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 4,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: indexBottomNavigationBar,
        onTap: (int index) {
          setState(() {
            this.indexBottomNavigationBar = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon:
                indexBottomNavigationBar == 0 ? iconListFill : iconListOutline,
            label: 'Список интересных мест',
          ),
          BottomNavigationBarItem(
            icon: indexBottomNavigationBar == 1
                ? iconHeartFill
                : iconHeartOutline,
            label: 'Хочу посетить / Посещенные места',
          ),
          BottomNavigationBarItem(
            icon: indexBottomNavigationBar == 2
                ? iconSettingsFill
                : iconSettingsOutline,
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}

class ScreenSightList extends StatelessWidget {
  const ScreenSightList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 64, 16, 16),
          child: Container(
            width: double.infinity,
            height: 72,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'Cписок\nинтересных мест',
                    style: Theme.of(context).textTheme.headline1),
              ]),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
          height: 40,
          width: double.infinity,
          child: IconButton(
            onPressed: () {
              print('$runtimeType tap on filter');
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => FiltersScreen(),
                ),
              );
            },
            icon: SvgPicture.asset(
              'assets/icons/filter.svg',
              color: Theme.of(context).buttonTheme.colorScheme?.background,
              width: 24,
              height: 24,
            ),
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              for (final sight in mocks) SightCard(sight),
            ],
          ),
        ),
      ]),
    );
  }
}
