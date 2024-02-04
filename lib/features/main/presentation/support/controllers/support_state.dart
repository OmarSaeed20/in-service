
import '/index.dart';

class SupportState extends Equatable {
  const SupportState({
    this.rx = RequestState.none,
    this.rxsend = RequestState.none,
    // this.messages = const [],
    required this.msgCtrl,
    required this.scrCtrl,
    this.currentPage = 1,
  });

  // final List<MessageEntity> messages;
  final RequestState rx, rxsend;
  final TextEditingController msgCtrl;
  final ScrollController scrCtrl;
  final int currentPage;

  SupportState copyWith({
    RequestState? rx,
    RequestState? rxsend,
    String? msgCtrl,
    ScrollController? scrCtrl,
    int? currentPage,
    }) =>
      SupportState(
        currentPage: currentPage ?? this.currentPage,
        rx: rx ?? this.rx,
        rxsend: rxsend ?? this.rxsend,
        msgCtrl: this.msgCtrl.copyWith(text: msgCtrl),
        scrCtrl: scrCtrl ?? this.scrCtrl,
      );
  @override
  List<Object?> get props => [msgCtrl, currentPage, rx, rxsend, scrCtrl];
}
