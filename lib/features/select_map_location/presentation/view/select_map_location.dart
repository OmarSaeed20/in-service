import 'package:in_service/index.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/select_map_location_controller.dart';
import 'widgets/serach_location_widget.dart';

class SelectMapLocationView extends StatefulWidget {
  const SelectMapLocationView({Key? key}) : super(key: key);

  @override
  State<SelectMapLocationView> createState() => _SelectMapLocationViewState();
}

class _SelectMapLocationViewState extends State<SelectMapLocationView> {
  GoogleMapController? _mapController;
  CameraPosition? _cameraPosition;
  // late LatLng _initialPosition;

  @override
  void initState() {
    super.initState();

    // if (widget.fromAddAddress)
    {
      // Get.find<SelectMapLocationControllerImp>().setPickData();
    }
    /* _initialPosition = LatLng(
      double.parse(
          Get.find<SplashController>().configModel!.defaultLocation!.lat ??
              '0'),
      double.parse(
          Get.find<SplashController>().configModel!.defaultLocation!.lng ??
              '0'),
    ); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ResponsiveHelper.isDesktop(context) ? const WebMenuBar() : null,
      // endDrawer: const MenuDrawer(),
      // endDrawerEnableOpenDragGesture: false,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: context.width,
            child: GetBuilder<SelectMapLocationControllerImp>(
              builder: (locationController) {
                /*print('--------------${'${locationController.pickPlaceMark.name ?? ''} '
              '${locationController.pickPlaceMark.locality ?? ''} '
              '${locationController.pickPlaceMark.postalCode ?? ''} ${locationController.pickPlaceMark.country ?? ''}'}');*/

                return Stack(
                  children: [
                    GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: locationController.state.location!,
                        zoom: 15,
                      ),
                      markers: <Marker>{
                        Marker(
                          markerId: const MarkerId('location_&_name'),
                          position: locationController.state.location!,
                          // infoWindow: InfoWindow(title: Get.arguments["name"]),
                          draggable: false, // Make the marker draggable
                        ),
                      },
                      circles: {
                        Circle(
                          circleId: const CircleId("location_"),
                          center: locationController.state.location!,
                          radius: 300.0,
                          strokeWidth: 1,
                          strokeColor: KColors.primary.withOpacity(0.40),
                          fillColor: KColors.primary.withOpacity(0.15),
                        ),
                      },
                      minMaxZoomPreference: const MinMaxZoomPreference(0, 16),
                      myLocationButtonEnabled: false,
                      onMapCreated: (GoogleMapController mapController) {
                        _mapController = mapController;
                        // if (!widget.fromAddAddress)
                        {
                          // Get.find<SelectMapLocationControllerImp>()
                          //     .getCurrentLocation(false, mapController: mapController);
                        }
                      },
                      scrollGesturesEnabled: !Get.isDialogOpen!,
                      zoomControlsEnabled: false,
                      onCameraMove: (CameraPosition cameraPosition) {
                        _cameraPosition = cameraPosition;
                      },
                      onCameraMoveStarted: () {
                        // locationController.disableButton();
                      },
                      onCameraIdle: () {
                        // Get.find<SelectMapLocationControllerImp>()
                        //     .updatePosition(_cameraPosition, false);
                      },
                    ),
                    /* Center(
                        child: /* !locationController.loading
                    ? Image.asset(Kimage.logoPng, height: 50, width: 50)
                    : */
                            const CircularProgressIndicator.adaptive()), */
                    Positioned(
                      top: 20.h,
                      left: 20.w,
                      right: 20.w,
                      child: SearchLocationWidget(
                        mapController: _mapController,
                        pickedAddress: Kstrings.searchHere.tr,
                      ),
                    ),
                    Positioned(
                      bottom: 80,
                      right: 10,
                      child: FloatingActionButton(
                        mini: true,
                        backgroundColor: Theme.of(context).cardColor,
                        onPressed: () => locationController.checkPermission(
                          () {
                            /* => locationController.getCurrentLocation(
                            false,
                            mapController: _mapController,
                          ) */
                          },
                        ),
                        child: Icon(Icons.my_location,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 10,
                      right: 10,
                      child: BtnWidget(
                        title: Kstrings.confirm.tr,
                        onTap: /* (locationController.buttonDisabled ||
                              locationController.loading)
                          ? null
                          :  */
                            () {
                          Get.back();
                          /* if (locationController.pickPosition.latitude !=
                                      0 &&
                                  locationController.pickAddress!.isNotEmpty) {
                                if (widget.onPicked != null) {
                                  AddressModel address = AddressModel(
                                    latitude: locationController
                                        .pickPosition.latitude
                                        .toString(),
                                    longitude: locationController
                                        .pickPosition.longitude
                                        .toString(),
                                    addressType: 'others',
                                    address: locationController.pickAddress,
                                    contactPersonName: locationController
                                        .getUserAddress()!
                                        .contactPersonName,
                                    contactPersonNumber: locationController
                                        .getUserAddress()!
                                        .contactPersonNumber,
                                  );
                                  // widget.onPicked!(address);
                                  Get.back();
                                } else if (widget.fromAddAddress) {
                                  if (widget.googleMapController != null) {
                                    widget.googleMapController!.moveCamera(
                                        CameraUpdate.newCameraPosition(
                                            CameraPosition(
                                                target: LatLng(
                                                  locationController
                                                      .pickPosition.latitude,
                                                  locationController
                                                      .pickPosition.longitude,
                                                ),
                                                zoom: 16)));
                                    locationController.setAddAddressData();
                                  }
                                  Get.back();
                                } else {
                                  AddressModel address = AddressModel(
                                    latitude: locationController
                                        .pickPosition.latitude
                                        .toString(),
                                    longitude: locationController
                                        .pickPosition.longitude
                                        .toString(),
                                    addressType: 'others',
                                    address: locationController.pickAddress,
                                  );
                                  locationController.saveAddressAndNavigate(
                                    address,
                                    widget.fromSignUp,
                                    widget.route,
                                    widget.canRoute,
                                    ResponsiveHelper.isDesktop(context),
                                  );
                                }
                              } else {
                                // showCustomSnackBar('pick_an_address'.tr);
                              } */
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
