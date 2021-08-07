import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/sight.dart';

import 'package:places/mocks.dart';
import 'package:places/ui/screens/res/text_styles.dart';
import 'package:places/ui/screens/sight_card_visiting.dart';

class VisitingScreen extends StatefulWidget {
  final List<Sight> favoriteSights;
  final Function favoriteSwitchSight;

  const VisitingScreen(this.favoriteSights, this.favoriteSwitchSight,
      {Key? key})
      : super(key: key);

  @override
  _VisitingScreenState createState() => _VisitingScreenState();
}

class _VisitingScreenState extends State<VisitingScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Container(
            height: 56,
            child: Center(
              child: Text('Избранное', style: visitingFavoriteTitle(context)),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(52),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Theme.of(context).cardColor,
                    ),
                    child: TabBar(
                      tabs: [
                        Tab(text: 'Хочу посетить'),
                        Tab(text: 'Посетил'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                SizedBox(height: 16),
                Expanded(
                  child: widget.favoriteSights.length == 0
                      ? titleEmptyList(context)
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              for (Sight sight in widget.favoriteSights)
                                SightCardWantVisit(
                                    sight, widget.favoriteSwitchSight),
                            ],
                          ),
                        ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(height: 16),
                SightCardVisited(sightGraveyard),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget titleEmptyList(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/card.svg',
              width: 64,
              height: 64,
              color: Theme.of(context).buttonTheme.colorScheme?.secondary,
            ),
            SizedBox(height: 24),
            Text(
              'Пусто',
              textAlign: TextAlign.center,
              style: addSightTopTitle.copyWith(
                color: Theme.of(context).buttonTheme.colorScheme?.secondary,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Отмечайте понравившиеся\nместа и они появиятся здесь.',
              textAlign: TextAlign.center,
              style: sightCardVisitingTitle.copyWith(
                color: Theme.of(context).buttonTheme.colorScheme?.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
