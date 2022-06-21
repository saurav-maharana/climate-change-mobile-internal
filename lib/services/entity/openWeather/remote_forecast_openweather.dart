class GetWeatherForecast {
  List weatherForecast;

  GetWeatherForecast({
    required this.weatherForecast,
  });

  factory GetWeatherForecast.fromJson(Map<String, dynamic> json) {
    List tempValues = [];

    final result = json['daily'];

    result.forEach((e) {
      tempValues.add(e['temp']['day']);
    });

    return GetWeatherForecast(weatherForecast: tempValues);
  }
}
