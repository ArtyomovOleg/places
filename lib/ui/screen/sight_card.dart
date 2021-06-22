import 'package:flutter/material.dart';

import 'package:places/domain/sight.dart';

class SightCard extends StatelessWidget {
  const SightCard(Sight sight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        Container(
          color: Color(0xFFFFFFFF),
          width: 361,
          height: 360,
          padding: const EdgeInsets.symmetric(horizontal: 0.5, vertical: 0),
          child: Row(children: [
            Container(
              width: 288,
              height: 360,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFDD0000),
                    Color(0xFFDDDD11),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment(0.6, 0),
                ),
              ),
            ),
            Container(
              width: 288,
              height: 360,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF0000DD),
                    Color(0xFFDD11DD),
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment(0, 0.6),
                ),
              ),
            ),
          ]),
        ),
      ]),
      Container(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(children: [
          Text('Пряности и радости'),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Row(children: [
              Text('ресторан'),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('закрыто до 09:00'),
              ),
            ]),
          )
        ]),
      ),
      Container(
        padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
        child: Text('Пряный вкус радостной жизни'),
      ),
      Container(
        padding: const EdgeInsets.only(bottom: 24, left: 16, right: 16),
        child: Text('Построить маршрут'),
      ),
      Divider(height: 8),
    ]);
  }
}
