class AppSecrets {
  final String openWeatherApiKey;

  const AppSecrets({
    required this.openWeatherApiKey,
  });

  static const appSecretsDev = AppSecrets(
    openWeatherApiKey: "667a6c0ad29fd30ee520f7ae07e416fd",
  );

  static const appSecretsQA = AppSecrets(
    openWeatherApiKey: "667a6c0ad29fd30ee520f7ae07e416fd",
  );

  static const appSecretsProd = AppSecrets(
    openWeatherApiKey: "667a6c0ad29fd30ee520f7ae07e416fd",
  );
}
