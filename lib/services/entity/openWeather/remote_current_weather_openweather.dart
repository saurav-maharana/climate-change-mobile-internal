class CurrentWeatherOpenWeather {
  final String cityName;
  final int visibility;
  final TemperatureInfo temperatureInfo;
  final WeatherIconDesc weatherIconDesc;
  final WindSpeed windSpeed;

  CurrentWeatherOpenWeather({
    required this.cityName,
    required this.visibility,
    required this.temperatureInfo,
    required this.weatherIconDesc,
    required this.windSpeed,
  });

  factory CurrentWeatherOpenWeather.fromJson(Map<String, dynamic> json) {
    final cityName = json['name'];
    final visibility = json['visibility'];

    final temperatureInfoJson = json['main'];
    final temperatureInfo = TemperatureInfo.fromJson(temperatureInfoJson);

    final weatherIconDescJson = json['weather'][0];
    final weatherIconDesc = WeatherIconDesc.fromJson(weatherIconDescJson);

    final windSpeedJson = json['wind'];
    final windSpeed = WindSpeed.fromJson(windSpeedJson);

    return CurrentWeatherOpenWeather(
      cityName: cityName,
      visibility: visibility,
      windSpeed: windSpeed,
      temperatureInfo: temperatureInfo,
      weatherIconDesc: weatherIconDesc,
    );
  }
}

class TemperatureInfo {
  final double temperature;
  final double feelsLike;
  final double maxTemp;
  final double minTemp;
  final int pressure;
  final int humidity;

  TemperatureInfo({
    required this.temperature,
    required this.feelsLike,
    required this.maxTemp,
    required this.minTemp,
    required this.pressure,
    required this.humidity,
  });

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    final feelslike = json['feels_like'];
    final maxTemp = json['temp_max'];
    final minTemp = json['temp_min'];
    final pressure = json['pressure'];
    final humidity = json['humidity'];

    return TemperatureInfo(
      temperature: temperature,
      feelsLike: feelslike,
      maxTemp: maxTemp,
      minTemp: minTemp,
      pressure: pressure,
      humidity: humidity,
    );
  }
}

class WeatherIconDesc {
  final String description;
  final String icon;

  WeatherIconDesc({
    required this.description,
    required this.icon,
  });

  factory WeatherIconDesc.fromJson(Map<String, dynamic> json) {
    final description = json['description'];
    final icon = json['icon'];

    return WeatherIconDesc(description: description, icon: icon);
  }
}

class WindSpeed {
  final double windSpeed;

  WindSpeed({
    required this.windSpeed,
  });

  factory WindSpeed.fromJson(Map<String, dynamic> json) {
    final windSpeed = json['speed'];

    return WindSpeed(windSpeed: windSpeed);
  }
}
