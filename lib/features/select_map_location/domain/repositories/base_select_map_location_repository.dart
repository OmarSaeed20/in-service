import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class BaseSelectMapLocationRepository {
  Future<Response> getAllAddress();

  Future<Response> getZone(String? lat, String? lng);

  Future<Response> removeAddressByID(int? id);

  // Future<Response> addAddress(AddressModel addressModel);

  // Future<Response> updateAddress(AddressModel addressModel, int? addressId);

  Future<bool> saveUserAddress(String address, List<int>? zoneIDs,
      List<int>? areaIDs, String? latitude, String? longitude);

  Future<Response> getAddressFromGeocode(LatLng latLng);

  String? getUserAddress();

  Future<Response> searchLocation(String text);

  Future<Response> getPlaceDetails(String? placeID);
}
