class Sight {
  String name = '';
  double lat = 0, lon = 0;
  String url = '';
  String details = '';
  SightType type = SightType.None;
  String assetImagePath = '';
}

enum SightType {
  None,
  Monument,
  Square,
  Beach,
  Graveyard,
}
