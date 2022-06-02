class CurrentWeather {
  final String cityName;
  final String description;
  final double currentTemperature;
  final double feelsLike;
  final double maximumTemperature;
  final double minimumTemperature;
  final int presssure;
  final int humidity;
  final int visibility;
  final double windSpeed;

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
