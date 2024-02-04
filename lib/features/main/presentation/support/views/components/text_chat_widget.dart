part of 'message_body.dart';

class TextChatWidget extends StatelessWidget {
  const TextChatWidget({
    super.key,
    required this.isCurrentChat,
    required this.text,
  });
  final bool isCurrentChat;
  final String text;

  @override
  Widget build(BuildContext context) {
    final bool isTextRTL = Utils.getDirection(text) == TextDirection.rtl;

    return _ChatHolderWidget(
      isMe: isCurrentChat,
      child: Text(
        text,
        textAlign: Utils.isRTL
            ? isTextRTL
                ? TextAlign.start
                : TextAlign.end
            : isTextRTL
                ? TextAlign.end
                : TextAlign.start,
        style: gStyle14(
          fontSize: 17,
          color: Colors.white,
        ),
      ),
    );
  }
}
