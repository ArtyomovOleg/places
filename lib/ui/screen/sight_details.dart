import 'package:flutter/material.dart';

import 'package:places/domain/sight.dart';

class SightDetails extends StatelessWidget {
  final Sight sight;

  const SightDetails(this.sight, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFFFFFF),
      child: Column(children: [
        Container(
          color: Color(0xFFFFFFFF),
          height: 360,
          width: double.infinity,
          padding: const EdgeInsets.all(0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                Expanded(
                  child: Container(
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
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 24),
              child: Column(children: [
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    sight.name,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Color(0xFF3B3E5B),
                      fontSize: 24.0,
                      height: 1.20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                Row(children: [
                  Text(
                    sight.type.toString().split('.')[1],
                    style: TextStyle(
                      color: Color(0xFF3B3E5B),
                      fontSize: 14.0,
                      height: 1.28571,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      'закрыто до 09:00',
                      style: TextStyle(
                        color: Color(0xFF7C7E92),
                        fontSize: 14.0,
                        height: 1.28571,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ])
              ]),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              width: double.infinity,
              child: Text(
                sight.details,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Color(0xFF3B3E5B),
                  fontSize: 14.0,
                  height: 1.28571,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.normal,
                  fontStyle: FontStyle.normal,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 48,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: const BoxDecoration(
                  color: Color(0xFF4CAF50),
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: Align(
                child: Text(
                  'Построить маршрут',
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 14.0,
                    height: 1.28571,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: 0.24,
              child: Divider(
                height: 16,
                thickness: 0.8,
                color: Color(0x8F7C7E92),
              ),
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    height: 40,
                    child: Text(
                      'Запланировать',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF7C7E92),
                        fontSize: 14.0,
                        height: 1.28571,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Container(
                    height: 40,
                    child: Text(
                      'В избранное',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF3B3E5B),
                        fontSize: 14.0,
                        height: 1.28571,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ]),
        )
      ]),
    );
  }
}
