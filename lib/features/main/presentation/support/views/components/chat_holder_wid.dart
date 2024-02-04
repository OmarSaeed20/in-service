part of 'message_body.dart';

class _ChatHolderWidget extends StatelessWidget {
  const _ChatHolderWidget({required this.isMe, required this.child});
  final bool isMe;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        Container(
          margin: gPaddingSymmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: 25.radius,
            color: isMe ? KColors.primary : KColors.blueL,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: context.width * (0.7)),
            child: Padding(
              padding: gPaddingSymmetric(horizontal: 16, vertical: 8),
              child: child,
            ),
          ),
        ),
      ],
    );
  }
}
