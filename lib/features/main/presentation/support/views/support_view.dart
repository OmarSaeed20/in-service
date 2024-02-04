import 'package:in_service/core/widget/handling_view_widgets/loading_state_widget.dart';
import 'package:in_service/features/main/presentation/support/controllers/support_controller.dart';
import 'package:in_service/index.dart';

import 'components/message_body.dart';
import 'components/support_app_bar.dart';

class SupportView extends StatelessWidget {
  const SupportView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<SupportController>(
      builder: (controller) {
        return Scaffold(
          appBar: const SupportBar(),
          extendBody: true,
          backgroundColor: KColors.scaffoldBackground2,
          // bottomNavigationBar: const CardTextFieldContent2(),
          body: controller.state.value.rx.isLoading
              ? const LoadingBody()
              : controller.state.value.rx.isLoading
                  ? const LoadingWidget()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: AnimationLimiter(
                            child: ListView.builder(
                              itemCount: 2,
                              shrinkWrap: true,
                              reverse: true,
                              keyboardDismissBehavior:
                                  ScrollViewKeyboardDismissBehavior.onDrag,
                              controller: controller.state.value.scrCtrl,
                              padding: gPadding(right: 15, left: 15),
                              itemBuilder: (context, index) {
                                // final MessageEntity message =
                                //     controller.state.value.messages[index];
                                final bool isMe = index == 0 || index == 2;

                                return MessageBody(
                                  isMe: isMe,
                                  index: index,
                                );
                              },
                            ),
                          ),
                        ),
                        const CardTextFieldContent2(),
                      ],
                    ),
        );
      },
    );
  }
}
