import 'package:geolocator/geolocator.dart';

class Location
{
  double latitude,longitude;
  Future<void> getLocation() async{
    try {
      print('method called');
      Position position = await Geolocator().getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      print(position);
      latitude =position.latitude;
      longitude= position.longitude;
    }
    catch(e)
    {
      print(e);
    }
  }
}