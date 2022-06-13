class CurrentWeather {
  final String cityName;
  final String description;
  final num currentTemperature;
  final num feelsLike;
  final num maximumTemperature;
  final num minimumTemperature;
  final num presssure;
  final num humidity;
  final num visibility;
  final num windSpeed;

  CurrentWeather({
    required this.cityName,
    required this.description,
    required this.currentTemperature,
    required this.feelsLike,
    required this.maximumTemperature,
    required this.minimumTemperature,
    required this.presssure,
    required this.humidity,
    required this.visibility,
    required this.windSpeed,
  });
}
