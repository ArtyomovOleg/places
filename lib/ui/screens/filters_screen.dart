import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:places/mocks.dart';
import 'package:places/ui/universal/buttons.dart';
import 'package:places/ui/universal/filter_catalog.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  double distance = 100; // distance slider in meters
  int filteredSights = 0;

  Map<String, bool> filterCatalog = {
    'Отель': false,
    'Ресторан': false,
    'Особое место': false,
    'Парк': false,
    'Музей': false,
    'Кафе': false,
  };

  Map<String, String> filterIcons = {
    'Отель': 'assets/icons/catalog/hotel.svg',
    'Ресторан': 'assets/icons/catalog/restourant.svg',
    'Особое место': 'assets/icons/catalog/particular_place.svg',
    'Парк': 'assets/icons/catalog/park.svg',
    'Музей': 'assets/icons/catalog/museum.svg',
    'Кафе': 'assets/icons/catalog/cafe.svg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Row(
                  children: [
                    Flexible(
                      child: Container(
                        height: 56,
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: BackButtonCentered(),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Container(
                        height: 56,
                        width: double.infinity,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            child: InkWell(
                              child: Text(
                                'Очистить',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .buttonTheme
                                          .colorScheme
                                          ?.background,
                                    ),
                              ),
                              onTap: () {
                                print('$runtimeType clear button has pressed');
                                setState(() {
                                  filterCatalog
                                      .updateAll((key, value) => false);
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(bottom: 24),
                child: Text(
                  'КАТЕГОРИИ',
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints.loose(
                  Size(double.infinity, 248 + 60),
                ),
                child: GridView.count(
                  padding: const EdgeInsets.symmetric(horizontal: 24.5),
                  crossAxisCount: 3,
                  crossAxisSpacing: 35,
                  mainAxisSpacing: 40,
                  children: [
                    for (final filterName in filterIcons.keys)
                      InkWell(
                        child: CatalogPanel(
                          filterName,
                          filterIcons[filterName] ?? '',
                          filterCatalog[filterName] ?? false,
                        ),
                        onTap: () {
                          setState(() {
                            filterCatalog[filterName] =
                                !(filterCatalog[filterName] ?? false);
                          });
                        },
                      ),
                  ],
                ),
              ),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Расстояние',
                        style: TextStyle(
                          color: Color(0xFF252849),
                          fontSize: 16.0,
                          height: 1.25,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'то 0.1 до 21k км',
                        style: TextStyle(
                          color: Color(0xFF7C7E92),
                          fontSize: 16.0,
                          height: 1.25,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Slider.adaptive(
                value: distance,
                onChanged: (distance) {
                  setState(() {
                    this.distance = distance;
                    filteredSightsCalc();
                  });
                  print('Distance change: $distance');
                },
                min: 100,
                // В академических целях увеличил дистанцию до 21k km
                max: 21000000,
                divisions: 100,
              ),
              Text('${distanceFormatter(distance)} km'),
              Expanded(child: Container()),
              InkWell(
                onTap: () {
                  print('$runtimeType show sights list');
                },
                child: Container(
                  width: double.infinity,
                  height: 48,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                      color:
                          Theme.of(context).buttonTheme.colorScheme?.background,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Center(
                    child: Text(
                      'ПОКАЗАТЬ ($filteredSights)',
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  void filteredSightsCalc() {
    filteredSights = 0;
    for (final mock in mocks) {
      // сравниваем в метрах
      if (mock.distanceTo(myGeoPoint) * 1000 <= distance) {
        filteredSights++;
      }
    }
  }

  String distanceFormatter(double distance) =>
      NumberFormat('#,###').format((distance / 1000).round());
}
