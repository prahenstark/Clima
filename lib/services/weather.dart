import '../services/location.dart';
import '../services/networking.dart';
import 'networking.dart';
import 'networking.dart';

const apiKey = "384f1cc3c7fa1f2df7df3448600b1f07";
const openWeatherMapURL ='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getCityWeather(String cityName) async{

     var url = '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric';
     NetworkHelper networkHelper = NetworkHelper(url);

     //The above 2 lines are as same as the below line. Both do the same work.
     //NetworkHelper networkHelper = NetworkHelper('$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
  Location location = Location();
  await location.getCurrentLocation();
  print("Inside get location.");

  NetworkHelper networkHelper = NetworkHelper("$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");

  var weatherData = await networkHelper.getData();

  return weatherData;
}

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
