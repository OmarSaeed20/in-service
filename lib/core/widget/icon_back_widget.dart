import '/index.dart';

class IconBackWidget extends StatelessWidget {
  const IconBackWidget({super.key, this.padding});
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? gPadding(top: 5),
      child: IconButton.filled(
        style: const ButtonStyle(
          // minimumSize: MaterialStatePropertyAll(Size(20, 20)),
          // maximumSize: MaterialStatePropertyAll(Size(30, 40)),
          padding: MaterialStatePropertyAll(EdgeInsetsDirectional.all(0)),
          // iconSize: MaterialStatePropertyAll(24),
          backgroundColor: MaterialStatePropertyAll(KColors.transparent),
          iconColor: MaterialStatePropertyAll(KColors.black),
          shape: MaterialStatePropertyAll(
            CircleBorder(
                // side: BorderSide(color: KColors.grey),
                ),
          ),
        ),
        onPressed: () => Get.back(),
        icon: const Icon(Icons.arrow_back),
      ),
    );
  }
}
