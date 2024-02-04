import 'package:in_service/core/util/utils.dart';
import 'package:in_service/features/main/presentation/support/controllers/support_controller.dart';
import 'package:in_service/index.dart';

part 'chat_holder_wid.dart';
part 'text_chat_widget.dart';
part 'chat_text_failed.dart';

class MessageBody extends StatelessWidget {
  const MessageBody({
    super.key,
    // required this.message,
    required this.isMe,
    required this.index,
  });

  final int index;
  // final MessageEntity message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return AnimationListWidget(
      index: index,
      curve: Curves.easeIn,
      horizontal: 300,
      child: TextChatWidget(
        isCurrentChat: isMe,
        text: "السلام عليكم ورحمة الله وبركاته",
      ),
    );
  }
}
