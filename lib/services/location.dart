import 'package:geolocator/geolocator.dart';

class Location {
  double longitude;
  double latitude;

  Future<void> getCurrentLocation() async{
    try {
      print("Inside try block.");
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,forceAndroidLocationManager: true);
      print( "trying to print type ${position.runtimeType}");
      latitude = position.latitude;
      longitude = position.longitude;

      print(position);
    } catch(e) {
      print("Error is "+e);
    }

  }


}