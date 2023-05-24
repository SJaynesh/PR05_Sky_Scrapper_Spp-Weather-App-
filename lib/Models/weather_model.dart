class Weather {
  String name;
  String region;
  String country;
  double lat;
  double lon;
  double temp_c;
  int is_day;
  String ConditionText;
  List hour;

  Weather({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.temp_c,
    required this.is_day,
    required this.ConditionText,
    required this.hour,
  });

  factory Weather.formMap({required Map data}) {
    return Weather(
      name: data['location']['name'],
      region: data['location']['region'],
      country: data['location']['country'],
      lat: data['location']['lat'],
      lon: data['location']['lon'],
      temp_c: data['current']['temp_c'],
      is_day: data['current']['is_day'],
      ConditionText: data['current']['condition']['text'],
      hour: data['forecast']['forecastday'][0]['hour'],
    );
  }
}
