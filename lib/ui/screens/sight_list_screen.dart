import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';

import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screens/add_sight_screen.dart';
import 'package:places/ui/screens/res/text_styles.dart';
import 'package:places/ui/screens/settings_screen.dart';
import 'package:places/ui/screens/sight_card.dart';
import 'package:places/ui/screens/visiting_screen.dart';
import 'package:places/ui/screens/widgets/search_bar.dart';

class SightListScreen extends StatefulWidget {
  const SightListScreen({Key? key}) : super(key: key);

  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  int indexBottomNavigationBar = 0;

  void mockAddSight(Sight sight) {
    print('$runtimeType mockAddSight & setState');
    setState(() {
      mocks.add(sight);
    });
  }

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
            label: '???????????? ???????????????????? ????????',
          ),
          BottomNavigationBarItem(
            icon: indexBottomNavigationBar == 1
                ? iconHeartFill
                : iconHeartOutline,
            label: '???????? ???????????????? / ???????????????????? ??????????',
          ),
          BottomNavigationBarItem(
            icon: indexBottomNavigationBar == 2
                ? iconSettingsFill
                : iconSettingsOutline,
            label: '??????????????????',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        child: Container(
          width: 177,
          height: 48,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFFFCDD3D),
                Color(0xFF4CAF50),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_rounded, size: 24, color: Colors.white),
              SizedBox(width: 8),
              Text(
                '?????????? ??????????',
                style: sightDetailsPlotACourse.copyWith(letterSpacing: 0.03),
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => AddSightScreen(
                mockAddSight: mockAddSight,
              ),
            ),
          );
        },
      ),
    );
  }
}

class ScreenSightList extends StatefulWidget {
  const ScreenSightList({Key? key}) : super(key: key);

  @override
  _ScreenSightListState createState() => _ScreenSightListState();
}

class _ScreenSightListState extends State<ScreenSightList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 64, 0, 16),
          child: Container(
            width: double.infinity,
            height: 72,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: 'C??????????\n???????????????????? ????????',
                    style: Theme.of(context).textTheme.headline1),
              ]),
            ),
          ),
        ),
        SearchBar(),
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
