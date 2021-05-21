import 'package:climate/screens/location_screen.dart';
import 'package:climate/services/networking.dart';
import 'package:flutter/material.dart';
import 'location.dart';
import './location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

const Apkey = '1efbdcf91c326f7ec66e8e955db7c035';

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location obj1 = Location();
    await obj1.getLocation();

    NetworkHelper helper = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=${obj1.latitude}&lon=${obj1.longitude}&appid=$Apkey&units=metric');
    var weatherdata = await helper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherdata,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SpinKitDoubleBounce(
      color: Colors.white,
      size: 100.0,
    )));
  }
}
