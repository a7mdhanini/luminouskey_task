import 'package:luminouskey_task/utils/helpers.dart';

class AddressModel {
  String latitude;
  String longitude;
  String country;
  String city;

  AddressModel({
    required this.latitude,
    required this.longitude,
    required this.country,
    required this.city,
  });

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      latitude: testMap(map, 'latitude', ''),
      longitude: testMap(map, 'longitude', ''),
      country: testMap(map, 'country', ''),
      city: testMap(map, 'city', ''),
    );
  }
}
