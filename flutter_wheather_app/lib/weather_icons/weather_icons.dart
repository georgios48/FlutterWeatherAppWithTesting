import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class GetWeatherIcons {
  BoxedIcon getIcon(String iconCode) {
    switch (iconCode) {
      case "01d":
        return const BoxedIcon(
          WeatherIcons.day_sunny,
          color: Colors.white,
          size: 100,
        );
      case "02d":
        return const BoxedIcon(
          WeatherIcons.day_cloudy_high,
          color: Colors.white,
          size: 100,
        );
      case "03d":
        return const BoxedIcon(
          WeatherIcons.day_cloudy_gusts,
          color: Colors.white,
          size: 100,
        );
      case "04d":
        return const BoxedIcon(
          WeatherIcons.raindrops,
          color: Colors.white,
          size: 100,
        );
      case "09d":
        return const BoxedIcon(
          WeatherIcons.rain,
          color: Colors.white,
          size: 100,
        );
      case "10d":
        return const BoxedIcon(
          WeatherIcons.rain_mix,
          color: Colors.white,
          size: 100,
        );
      case "11d":
        return const BoxedIcon(
          WeatherIcons.storm_warning,
          color: Colors.white,
          size: 100,
        );
      case "13d":
        return const BoxedIcon(
          WeatherIcons.snowflake_cold,
          color: Colors.white,
          size: 100,
        );
      case "50d":
        return const BoxedIcon(
          WeatherIcons.wind,
          color: Colors.white,
          size: 100,
        );
      case "01n":
        return const BoxedIcon(
          WeatherIcons.night_clear,
          color: Colors.white,
          size: 100,
        );
      case "02n":
        return const BoxedIcon(
          WeatherIcons.night_cloudy,
          color: Colors.white,
          size: 100,
        );
      case "03n":
        return const BoxedIcon(
          WeatherIcons.night_cloudy_gusts,
          color: Colors.white,
          size: 100,
        );
      case "04n":
        return const BoxedIcon(
          WeatherIcons.raindrops,
          color: Colors.white,
          size: 100,
        );
      case "09n":
        return const BoxedIcon(
          WeatherIcons.rain,
          color: Colors.white,
          size: 100,
        );
      case "10n":
        return const BoxedIcon(
          WeatherIcons.rain_mix,
          color: Colors.white,
          size: 100,
        );
      case "11n":
        return const BoxedIcon(
          WeatherIcons.storm_warning,
          color: Colors.white,
          size: 100,
        );
      case "13n":
        return const BoxedIcon(
          WeatherIcons.snowflake_cold,
          color: Colors.white,
          size: 100,
        );
      case "50n":
        return const BoxedIcon(
          WeatherIcons.wind,
          color: Colors.white,
          size: 100,
        );
      default:
        return const BoxedIcon(
          Icons.question_mark_rounded,
          color: Colors.white,
          size: 100,
        );
    }
  }
}
