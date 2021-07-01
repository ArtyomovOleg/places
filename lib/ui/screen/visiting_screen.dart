import 'package:flutter/material.dart';

import 'package:places/mocks.dart';
import 'package:places/ui/screen/sight_card_visiting.dart';

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
              child: Text(
                'Избранное',
                style: TextStyle(
                  color: Color(0xFF252849),
                  fontSize: 18.0,
                  height: 1.33333,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          backgroundColor: Color(0xFFFFFFFF),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(52),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Color(0xFFF5F5F5),
                    ),
                    child: TabBar(
                      labelColor: Color(0xFFFFFFFF),
                      unselectedLabelColor: Color(0xFF7C7E92),
                      labelStyle: TextStyle(
                        color: Color(0xFF252849),
                        fontSize: 14.0,
                        height: 1.28571,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                      indicator: BoxDecoration(
                        color: Color(0xFF3B3E5B),
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
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
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: 1,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_rounded),
              label: 'Список интересных мест',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded),
              label: 'Хочу посетить / Посещенные места',
            ),
          ],
        ),
      ),
    );
  }
}