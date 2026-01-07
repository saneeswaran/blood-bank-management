import 'package:blood_bank/core/constants/constats.dart';
import 'package:blood_bank/features/home%20page/model/location/location.dart';
import 'package:fpdart/fpdart.dart';
import 'package:geocoding/geocoding.dart' hide Location;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationUtil {
  static Future<Either<Failure, void>> askLocationPermission() async {
    try {
      final status = await Permission.location.request();
      if (status.isGranted) {
        return const Right(null);
      } else {
        Geolocator.openAppSettings();
        await Geolocator.checkPermission();
        return const Left("Location permission not granted");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  static Future<Either<Failure, LatLng>> getCurrentLatLong() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
        ),
      );

      return Right(LatLng(position.latitude, position.longitude));
    } catch (e) {
      return Left(e.toString());
    }
  }

  static Future<Either<Failure, Location>> getCurrentLocation(
    LatLng latlng,
  ) async {
    try {
      final placeses = await placemarkFromCoordinates(
        latlng.latitude,
        latlng.longitude,
      );
      final place = placeses.first;

      final Location location = Location(
        latitude: latlng.latitude,
        longitude: latlng.longitude,
        fullAddress:
            "${place.name}, ${place.subLocality}, ${place.locality}, "
            "${place.administrativeArea}, ${place.postalCode}, ${place.country}",

        streetName:
            "${place.subThoroughfare ?? ""} ${place.thoroughfare ?? place.name ?? ""}"
                .trim(),

        city: place.locality ?? "",
        state: place.administrativeArea ?? "",
        pincode: int.tryParse(place.postalCode ?? "") ?? 0,
      );

      return Right(location);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
