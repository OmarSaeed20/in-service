import 'package:in_service/index.dart';

class BuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BuildAppBar({
    super.key,
    required this.title,
    this.actions,
    this.padding,
  });
  final String title;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? padding;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: gStyle16(fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
      actions: actions,
    );
  }
}
