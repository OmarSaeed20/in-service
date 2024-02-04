import 'package:in_service/core/widget/dialogs/components/success_dialog.dart';
import 'package:in_service/index.dart';

class VerfiyConfirmedDialog extends StatelessWidget {
  final Animation<double> opacity, scale;
  const VerfiyConfirmedDialog(
      {super.key, required this.opacity, required this.scale});

  @override
  Widget build(BuildContext context) => SuccessDialog(
        opacity: opacity,
        scale: scale,
        title: Kstrings.projectName,
        sup: Kstrings.verifySuc,
        img: Kimage.verifiedIcon,
      );
}
