import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:places/domain/sight.dart';
import 'package:places/mocks.dart';
import 'package:places/ui/screens/add_sight_screen.dart';
import 'package:places/ui/screens/res/svg_pictures.dart';
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
  List<Sight> favoriteSights = [];

  void mockAddSight(Sight sight) {
    print('$runtimeType mockAddSight & setState');
    setState(() {
      mocks.add(sight);
    });
  }

  void favoriteSwitchSight(Sight sight) {
    setState(() {
      if (favoriteSights.contains(sight)) {
        favoriteSights.remove(sight);
      } else {
        favoriteSights.add(sight);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _navigationBarScreens = <Widget>[
      ScreenSightList(favoriteSights, favoriteSwitchSight),
      VisitingScreen(favoriteSights, favoriteSwitchSight),
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
            icon: indexBottomNavigationBar == 0
                ? SvgIcon(context, 'ListFill')
                : SvgIcon(context, 'ListOutline'),
            label: 'Список интересных мест',
          ),
          BottomNavigationBarItem(
            icon: indexBottomNavigationBar == 1
                ? SvgIcon(context, 'HeartFill')
                : SvgIcon(context, 'HeartOutline'),
            label: 'Хочу посетить / Посещенные места',
          ),
          BottomNavigationBarItem(
            icon: indexBottomNavigationBar == 2
                ? SvgIcon(context, 'SettingsFill')
                : SvgIcon(context, 'SettingsOutline'),
            label: 'Настройки',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatingActionButton(context),
    );
  }

  Widget floatingActionButton(BuildContext context) {
    return indexBottomNavigationBar != 0
        ? Container()
        : InkWell(
            child: Container(
              width: 177,
              height: 48,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFCDD3D), Color(0xFF4CAF50)],
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
                    'НОВОЕ МЕСТО',
                    style:
                        sightDetailsPlotACourse.copyWith(letterSpacing: 0.03),
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
          );
  }
}

class ScreenSightList extends StatefulWidget {
  final List<Sight> favoriteSights;
  final Function favoriteSwitchSight;

  ScreenSightList(this.favoriteSights, this.favoriteSwitchSight, {Key? key})
      : super(key: key);

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
                    text: 'Cписок\nинтересных мест',
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
              for (final sight in mocks)
                SightCard(
                  sight,
                  widget.favoriteSights.contains(sight),
                  widget.favoriteSwitchSight,
                ),
            ],
          ),
        ),
      ]),
    );
  }
}
