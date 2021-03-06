import 'package:flutter/material.dart';

import 'package:places/mocks.dart';
import 'package:places/ui/screens/res/text_styles.dart';
import 'package:places/ui/screens/sight_card_visiting.dart';

class VisitingScreen extends StatefulWidget {
  const VisitingScreen({Key? key}) : super(key: key);

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
                SightCardWantVisit(sightMonument),
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
}
