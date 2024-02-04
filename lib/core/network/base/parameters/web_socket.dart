import 'package:in_service/index.dart';

class WebSocketParameter extends Equatable {
  final String url;
  final Map<String, String> headers;
  const WebSocketParameter({required this.url, required this.headers});
  @override
  List<Object> get props => [url, headers];
}
