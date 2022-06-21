class PollutionInfo {
  final Components components;
  final AirQualityIndex airQualityIndex;

  PollutionInfo({
    required this.components,
    required this.airQualityIndex,
  });

  factory PollutionInfo.fromJson(Map<String, dynamic> json) {
    final componentsJson = json['list'][0]['components'];
    final components = Components.fromJson(componentsJson);

    final airQualityIndexJson = json['list'][0]['main'];
    final airQualityIndex = AirQualityIndex.fromJson(airQualityIndexJson);

    return PollutionInfo(
      components: components,
      airQualityIndex: airQualityIndex,
    );
  }
}

class Components {
  final num co;
  final num no;
  final num no2;
  final num o3;
  final num so2;
  final num pm2_5;
  final num pm10;
  final num nh3;

  Components({
    required this.co,
    required this.no,
    required this.no2,
    required this.o3,
    required this.so2,
    required this.pm2_5,
    required this.nh3,
    required this.pm10,
  });
  factory Components.fromJson(Map<String, dynamic> json) {
    final co = json['co'];
    final no = json['no'];
    final no2 = json['no2'];
    final o3 = json['o3'];
    final so2 = json['so2'];
    final pm2_5 = json['pm2_5'];
    final nh3 = json['nh3'];
    final pm10 = json['pm10'];

    return Components(
      co: co,
      no: no,
      no2: no2,
      o3: o3,
      so2: so2,
      pm2_5: pm2_5,
      nh3: nh3,
      pm10: pm10,
    );
  }
}

class AirQualityIndex {
  final num airQualityIndex;

  AirQualityIndex({
    required this.airQualityIndex,
  });

  factory AirQualityIndex.fromJson(Map<String, dynamic> json) {
    final airQualityIndex = json['aqi'];

    return AirQualityIndex(airQualityIndex: airQualityIndex);
  }
}
