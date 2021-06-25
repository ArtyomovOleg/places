import 'domain/sight.dart';

final List<Sight> mocks = [
  sightMonument,
  sightSquare,
  sightBeach,
  sightGraveyard,
];

final sightMonument = Sight()
  ..details = 'А. С. Пушкину (Москва, Пушкинская площадь)'
  ..lat = 0.01
  ..lon = 0.01
  ..name = 'Памятник'
  ..type = SightType.Monument
  ..url = 'https://ru.wikipedia.org/wiki/Памятник_А._С._Пушкину_(Москва,_Пушкин'
      'ская_площадь)';

final sightSquare = Sight()
  ..details = 'Таймс-сквер'
  ..lat = 0.02
  ..lon = 0.02
  ..name = 'Площадь'
  ..type = SightType.Square
  ..url = 'https://ru.wikipedia.org/wiki/Таймс-сквер';

final sightBeach = Sight()
  ..details = 'Варадеро'
  ..lat = 0.03
  ..lon = 0.03
  ..name = 'Пляж'
  ..type = SightType.Beach
  ..url = 'https://ru.wikipedia.org/wiki/Варадеро';

final sightGraveyard = Sight()
  ..details = 'Пер-Лашез'
  ..lat = 0.04
  ..lon = 0.04
  ..name = 'Кладбище'
  ..type = SightType.Graveyard
  ..url = 'https://ru.wikipedia.org/wiki/Пер-Лашез';
