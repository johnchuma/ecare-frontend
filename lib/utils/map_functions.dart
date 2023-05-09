// ignore_for_file: avoid_print, no_leading_underscores_for_local_identifiers

import 'package:doctor/utils/authentication.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import '../modules/authentication/models/user.dart';

Future myCoordinates() async {
  Location location = Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }
  _locationData = await location.getLocation();
  saveMyLocation(_locationData);
  location.onLocationChanged.listen((LocationData currentLocation) {
    saveMyLocation(currentLocation);
  });
}

double getDistanceBetween(
    double lat1, double long1, double lat2, double long2) {
  return Geolocator.distanceBetween(lat1, long1, lat2, long2);
}

void saveMyLocation(LocationData value) {
  User me = getMyInfo();
  me.latitude = value.latitude;
  me.longitude = value.longitude;
  me.save();
}
