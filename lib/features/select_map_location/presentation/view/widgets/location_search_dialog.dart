import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:in_service/core/util/extensions.dart';

class LocationSearchDialog extends StatelessWidget {
  final GoogleMapController? mapController;
  final bool? isPickedUp;
  const LocationSearchDialog({
    required this.mapController,
    super.key,
    this.isPickedUp,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Scrollable(
      viewportBuilder: (context, viewPortOffset) => Container(
        padding: gPaddingAll(8),
        alignment: Alignment.topCenter,
        child: Material(
          shape: RoundedRectangleBorder(borderRadius: 10.radius),
          child: SizedBox(
            width: context.width,
            child: TypeAheadField<PredictionModel>(
              textFieldConfiguration: TextFieldConfiguration(
                controller: controller,
                textInputAction: TextInputAction.search,
                autofocus: true,
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  hintText: 'search location'.tr,
                  border: OutlineInputBorder(
                    borderRadius: 10.radius,
                    borderSide: BorderSide.none,
                  ),
                  hintStyle:
                      Theme.of(context).textTheme.displayMedium!.copyWith(
                            fontSize: 14,
                            color: Theme.of(context).disabledColor,
                          ),
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                ),
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                      fontSize: 16,
                    ),
              ),
              suggestionsCallback: (pattern) async => {
                /* 
                          await Get.find<SelectMapLocationControllerImp>()
                              .searchLocation(context, pattern) */
              },
              itemBuilder: (context, PredictionModel suggestion) {
                return Padding(
                  padding: gPaddingAll(10),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on),
                      Expanded(
                        child: Text(
                          suggestion.description!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .color,
                                fontSize: 20,
                              ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              onSuggestionSelected: (PredictionModel suggestion) {
                // Get.find<SelectMapLocationControllerImp>().setLocation(
                //     suggestion.placeId,
                //     suggestion.description,
                //     mapController);
                // Get.back();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class PredictionModel {
  String? description, id, placeId, reference;
  int? distanceMeters;

  PredictionModel({
    this.description,
    this.id,
    this.distanceMeters,
    this.placeId,
    this.reference,
  });

  PredictionModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    id = json['id'];
    distanceMeters = json['distance_meters'];
    placeId = json['place_id'];
    reference = json['reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['id'] = id;
    data['distance_meters'] = distanceMeters;
    data['place_id'] = placeId;
    data['reference'] = reference;
    return data;
  }
}
