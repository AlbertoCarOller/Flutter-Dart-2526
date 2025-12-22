class Weather {
  Weather({
    required this.latitude,
    required this.longitude,
    required this.generationtimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.hourlyUnits,
    required this.hourly,
    required this.dailyUnits,
    required this.daily,
  });

  final double? latitude;
  final double? longitude;
  final double? generationtimeMs;
  final int? utcOffsetSeconds;
  final String? timezone;
  final String? timezoneAbbreviation;
  final double? elevation;
  final HourlyUnits? hourlyUnits;
  final Hourly? hourly;
  final DailyUnits? dailyUnits;
  final Daily? daily;

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      latitude: json["latitude"],
      longitude: json["longitude"],
      generationtimeMs: json["generationtime_ms"],
      utcOffsetSeconds: json["utc_offset_seconds"],
      timezone: json["timezone"],
      timezoneAbbreviation: json["timezone_abbreviation"],
      elevation: json["elevation"],
      hourlyUnits: json["hourly_units"] == null
          ? null
          : HourlyUnits.fromJson(json["hourly_units"]),
      hourly: json["hourly"] == null ? null : Hourly.fromJson(json["hourly"]),
      dailyUnits: json["daily_units"] == null
          ? null
          : DailyUnits.fromJson(json["daily_units"]),
      daily: json["daily"] == null ? null : Daily.fromJson(json["daily"]),
    );
  }

  @override
  String toString() {
    return "$latitude, $longitude, $generationtimeMs, $utcOffsetSeconds, $timezone, $timezoneAbbreviation, $elevation, $hourlyUnits, $hourly, $dailyUnits, $daily, ";
  }
}

class Daily {
  Daily({
    required this.time,
    required this.temperature2MMax,
    required this.temperature2MMin,
  });

  final List<DateTime> time;
  final List<double> temperature2MMax;
  final List<double> temperature2MMin;

  factory Daily.fromJson(Map<String, dynamic> json) {
    return Daily(
      time: json["time"] == null
          ? []
          : List<DateTime>.from(
              json["time"]!.map((x) => DateTime.tryParse(x ?? "")),
            ),
      temperature2MMax: json["temperature_2m_max"] == null
          ? []
          : List<double>.from(json["temperature_2m_max"]!.map((x) => x)),
      temperature2MMin: json["temperature_2m_min"] == null
          ? []
          : List<double>.from(json["temperature_2m_min"]!.map((x) => x)),
    );
  }

  @override
  String toString() {
    return "$time, $temperature2MMax, $temperature2MMin, ";
  }
}

class DailyUnits {
  DailyUnits({
    required this.time,
    required this.temperature2MMax,
    required this.temperature2MMin,
  });

  final String? time;
  final String? temperature2MMax;
  final String? temperature2MMin;

  factory DailyUnits.fromJson(Map<String, dynamic> json) {
    return DailyUnits(
      time: json["time"],
      temperature2MMax: json["temperature_2m_max"],
      temperature2MMin: json["temperature_2m_min"],
    );
  }

  @override
  String toString() {
    return "$time, $temperature2MMax, $temperature2MMin, ";
  }
}

class Hourly {
  Hourly({
    required this.time,
    required this.temperature2M,
    required this.precipitationProbability,
    required this.cloudCover,
    required this.windSpeed10M,
  });

  final List<String> time;
  final List<double> temperature2M;
  final List<int> precipitationProbability;
  final List<int> cloudCover;
  final List<double> windSpeed10M;

  factory Hourly.fromJson(Map<String, dynamic> json) {
    return Hourly(
      time: json["time"] == null
          ? []
          : List<String>.from(json["time"]!.map((x) => x)),
      temperature2M: json["temperature_2m"] == null
          ? []
          : List<double>.from(json["temperature_2m"]!.map((x) => x)),
      precipitationProbability: json["precipitation_probability"] == null
          ? []
          : List<int>.from(json["precipitation_probability"]!.map((x) => x)),
      cloudCover: json["cloud_cover"] == null
          ? []
          : List<int>.from(json["cloud_cover"]!.map((x) => x)),
      windSpeed10M: json["wind_speed_10m"] == null
          ? []
          : List<double>.from(json["wind_speed_10m"]!.map((x) => x)),
    );
  }

  @override
  String toString() {
    return "$time, $temperature2M, $precipitationProbability, $cloudCover, $windSpeed10M, ";
  }
}

class HourlyUnits {
  HourlyUnits({
    required this.time,
    required this.temperature2M,
    required this.precipitationProbability,
    required this.cloudCover,
    required this.windSpeed10M,
  });

  final String? time;
  final String? temperature2M;
  final String? precipitationProbability;
  final String? cloudCover;
  final String? windSpeed10M;

  factory HourlyUnits.fromJson(Map<String, dynamic> json) {
    return HourlyUnits(
      time: json["time"],
      temperature2M: json["temperature_2m"],
      precipitationProbability: json["precipitation_probability"],
      cloudCover: json["cloud_cover"],
      windSpeed10M: json["wind_speed_10m"],
    );
  }

  @override
  String toString() {
    return "$time, $temperature2M, $precipitationProbability, $cloudCover, $windSpeed10M, ";
  }
}
