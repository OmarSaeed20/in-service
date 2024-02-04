import 'package:in_service/index.dart';

import 'components/success_dialog.dart';

class ReservationConfirmedDialog extends StatelessWidget {
  final Animation<double> opacity, scale;
  const ReservationConfirmedDialog(
      {super.key, required this.opacity, required this.scale});

  @override
  Widget build(BuildContext context)  => SuccessDialog(
        opacity: opacity,
        scale: scale,
        title: Kstrings.reservationHasBeenConfirmed.tr,
        sup: Kstrings.yourApplicationIsUnderReview.tr,
        img: Kimage.verifiedIcon,
      );
}

 