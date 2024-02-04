import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:in_service/index.dart';

import 'location_search_dialog.dart';

class SearchLocationWidget extends StatelessWidget {
  final GoogleMapController? mapController;
  final String? pickedAddress, hint;
  final bool? isPickedUp;
  const SearchLocationWidget({
    super.key,
    required this.mapController,
    required this.pickedAddress,
    this.isPickedUp,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.dialog(
        LocationSearchDialog(
          mapController: mapController,
          isPickedUp: isPickedUp,
        ),
      ),
      child: Container(
        height: 50.h,
        padding: gPaddingAll(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: 10.radius,
        ),
        child: Row(
          children: [
            Icon(
              Icons.map,
              size: 25,
              color: Theme.of(context).primaryColor,
            ),
            8.sW,
            Expanded(
              child: (!pickedAddress.isEmptyOrNul)
                  ? Text(
                      pickedAddress.valide(),
                      style: gStyle18(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  : Text(
                      hint ?? '',
                      style: gStyle14(
                        fontSize: 15,
                        color: KColors.textSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
            ),
            8.sW,
            SvgPicture.asset(
              Kimage.search,
              // ignore: deprecated_member_use
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
          ],
        ),
      ),
    );
  }
}
