import '/index.dart';

class RadioListTileWiget extends StatelessWidget {
  const RadioListTileWiget({
    super.key,
    required this.title,
    required this.vlu,
    required this.groupVlu,
    required this.onChanged,
  });
  final String title;
  final Object vlu, groupVlu;
  final void Function(Object?) onChanged;
  @override
  Widget build(BuildContext context) => RadioListTile(
        value: vlu,
        groupValue: groupVlu,
        onChanged: onChanged,
        activeColor: KColors.primary,
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: gStyle14(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      );
}
