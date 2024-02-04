import 'package:get/get_connect/http/src/response/response.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '/features/select_map_location/domain/repositories/base_select_map_location_repository.dart';
import '../data_source/remote/select_map_location_client.dart';
import '/index.dart';

class SelectMapLocationRepositoryImp
    implements BaseSelectMapLocationRepository {
  SelectMapLocationRepositoryImp(this.remoteData, this.preferences);
  final SelectMapLocationClient remoteData;
  final AppPreferences preferences;

  @override
  Future<Response> getAddressFromGeocode(LatLng latLng) {
    throw UnimplementedError();
  }

  @override
  Future<Response> getAllAddress() {
    throw UnimplementedError();
  }

  @override
  Future<Response> getPlaceDetails(String? placeID) {
    throw UnimplementedError();
  }

  @override
  String? getUserAddress() {
    throw UnimplementedError();
  }

  @override
  Future<Response> getZone(String? lat, String? lng) {
    throw UnimplementedError();
  }

  @override
  Future<Response> removeAddressByID(int? id) {
    throw UnimplementedError();
  }

  @override
  Future<bool> saveUserAddress(String address, List<int>? zoneIDs,
      List<int>? areaIDs, String? latitude, String? longitude) {
    throw UnimplementedError();
  }

  @override
  Future<Response> searchLocation(String text) {
    throw UnimplementedError();
  }
}
