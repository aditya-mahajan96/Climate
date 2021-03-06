import 'package:climate/screens/location.dart';
import 'package:climate/services/networking.dart';

const Apkey = '*****ENTER YOUR KEY';
const openWeatherUrl = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> get_Cityweather(String cityName) async {
    var url = '$openWeatherUrl?q=$cityName&appid=$Apkey&units=metric';
    print('url is$url');
    NetworkHelper obj2 = NetworkHelper(url);
    var citydata = await obj2.getData();
    return citydata;
  }

  Future<dynamic> getLocationData() async {
    Location obj1 = Location();
    await obj1.getLocation();

    NetworkHelper helper = NetworkHelper(
        '$openWeatherUrl?lat=${obj1.latitude}&lon=${obj1.longitude}&appid=$Apkey&units=metric');
    var weatherdata = await helper.getData();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
