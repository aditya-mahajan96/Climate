import 'package:climate/screens/location_screen.dart';
import 'package:climate/services/networking.dart';
import 'package:flutter/material.dart';
import 'location.dart';
import './location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

double latitude, longitude;
const Apkey = '1efbdcf91c326f7ec66e8e955db7c035';

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    print('this method called');
    getLocation();
  }

  void getLocation() async {
    Location obj1 = Location();
    await obj1.getLocation();
    latitude = obj1.latitude;
    longitude = obj1.longitude;

    NetworkHelper helper = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$Apkey');
    var weatherdata = await helper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Spinkit,
    ));
  }
}
