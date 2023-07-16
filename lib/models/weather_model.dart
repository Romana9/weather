class WeatherModel {
  String name;
  DateTime date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;

  WeatherModel(
      {required this.name,
      required this.date,
      required this.temp,
      required this.maxTemp,
      required this.minTemp,
      required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data) {
    var jsonData = data["forecast"]["forecastday"][0]["day"];

    return WeatherModel(
        name: data["location"]["name"],
        date: DateTime.parse(data["location"]["localtime"]),
        temp: jsonData["avgtemp_c"],
        maxTemp: jsonData["maxtemp_c"],
        minTemp: jsonData["mintemp_c"],
        weatherStateName: jsonData["condition"]["text"]);
  }

  String getImage() {
    if (weatherStateName == "Clear" || weatherStateName == "Light Cloud") {
      return "assets/images/clear.png";
    } else if (weatherStateName == "Sleet" ||
        weatherStateName == "Snow" ||
        weatherStateName == "Hail") {
      return "assets/images/snow.png";
    } else if (weatherStateName == "Heavy Cloud" ||
        weatherStateName == "Partly cloudy") {
      return "assets/images/cloudy.png";
    } else if (weatherStateName == "Light Rain" ||
        weatherStateName == "Heavy Rain" ||
        weatherStateName == "Showers") {
      return "assets/images/rainy.png";
    } else if (weatherStateName == "Thunderstorm" ||
        weatherStateName == "Thunder") {
      return "assets/images/thunderstorm.png";
    } else {
      return "assets/images/clear.png";
    }
  }
}
