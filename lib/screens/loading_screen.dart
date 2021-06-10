import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather.dart';
import '../services/weather.dart';
import 'location_screen.dart';
import 'package:clima/services/weather.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    super.initState();
    getLocation();
    print("Hello inside init");
  }

  void getLocation() async{

    // WeatherModel weatherModel = WeatherModel();
    // var weatherData = weatherModel.getLocationWeather();
    //the code below is equal to above two lines only await is added below because getLocationWeather() returns a Future data.

    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWeather: weatherData,);
    }));


  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
