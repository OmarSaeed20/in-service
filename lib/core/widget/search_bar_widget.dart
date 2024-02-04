import '/index.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: gPaddingSymmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: 40.radius,
        color: KColors.fillColor,
      ),
      child: ListTile(
        contentPadding: gPadding(),
        onTap: onTap,
        shape: BeveledRectangleBorder(borderRadius: 40.radius),
        leading: const CircleAvatar(
          backgroundColor: KColors.transparent,
          child: ImageWidget(
            path: Kimage.searchIcon,
            height: /* context.width < 350 ? 15 :  */ 20,
          ),
        ),
        horizontalTitleGap: 0,
        title: Text(
          Kstrings.searchHere.tr,
          style: gStyle14(fontSize: 11, fontWeight: FontWeight.w300),
        ),
        trailing: const ImageWidget(
          path: Kimage.settingIcon,
          height: /* context.width < 350 ? 15 : */ 20,
        ),
      ),
    );
  }
}
