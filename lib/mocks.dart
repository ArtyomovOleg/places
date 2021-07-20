import 'dart:math';

import 'domain/sight.dart';

final List<Sight> mocks = [
  sightMonument,
  sightSquare,
  sightBeach,
  sightGraveyard,
];

final sightMonument = Sight()
  ..details = '''А. С. Пушкину (Москва, Пушкинская площадь)
Скульптор изобразил поэта в полный рост, одетым в длинный сюртук, поверх 
которого наброшен плащ. Голова в задумчивости наклонена, словно он размышляет 
над новым произведением. Правая рука привычным жестом заложена за борт сюртука; 
в левой, откинутой назад, — шляпа.
'''
  ..lat = 55.7653847018087
  ..lon = 37.60549502372489
  ..name = 'Памятник'
  ..type = SightType.Monument
  ..url = 'https://ru.wikipedia.org/wiki/Памятник_А._С._Пушкину_(Москва,_Пушкин'
      'ская_площадь)'
  ..assetImagePath = 'assets/images/monument_pushkin.jpg';

final sightSquare = Sight()
  ..details = 'Таймс-сквер'
  ..lat = 40.7576509497921
  ..lon = -73.98574894216769
  ..name = 'Площадь'
  ..type = SightType.Square
  ..url = 'https://ru.wikipedia.org/wiki/Таймс-сквер'
  ..assetImagePath = 'assets/images/square_times.jpeg';

final sightBeach = Sight()
  ..details = 'Варадеро'
  ..lat = 23.141623762177677
  ..lon = -81.2863738724366
  ..name = 'Пляж'
  ..type = SightType.Beach
  ..url = 'https://ru.wikipedia.org/wiki/Варадеро'
  ..assetImagePath = 'assets/images/beach_varadero.jpeg';

final sightGraveyard = Sight()
  ..details = 'Пер-Лашез'
  ..lat = 48.86228679562162
  ..lon = 2.3949109317077273
  ..name = 'Кладбище'
  ..type = SightType.Graveyard
  ..url = 'https://ru.wikipedia.org/wiki/Пер-Лашез'
  ..assetImagePath = 'assets/images/graveyard_pere_lachaise.jpeg';

final LatLon myGeoPoint = LatLon(
  rnd.nextDouble() * 180 - 90,
  rnd.nextDouble() * 360 - 180,
);

Random rnd = Random();
