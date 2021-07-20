import 'dart:math';

class Sight {
  String name = '';
  double lat = 0, lon = 0;
  String url = '';
  String details = '';
  SightType type = SightType.None;
  String assetImagePath = '';

  /// return double [distance] in kilometers
  double distanceTo(LatLon geoPoint) {
    double ky = 40000 / 360;
    double kx = cos(pi * lat / 180.0) * ky;
    double dx = ((lon - geoPoint.lon) * kx).abs();
    double dy = ((lat - geoPoint.lat) * ky).abs();
    final double result = sqrt(dx * dx + dy * dy);
    print('$runtimeType calc: $geoPoint');
    print('$runtimeType result: $result');

    return result;
  }
}

class LatLon {
  double lat = 0;
  double lon = 0;

  @override
  String toString() {
    return '(${lat.toInt()}, ${lon.toInt()})';
  }

  LatLon(this.lat, this.lon);
}

enum SightType {
  None,
  Monument,
  Square,
  Beach,
  Graveyard,
}
