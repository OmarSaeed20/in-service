import 'dart:async';

import 'package:in_service/index.dart';

class ConnectionCheckerImpl extends GetxService {
  ConnectionCheckerImpl({required this.internetConnectionChecker});
  final InternetConnectionChecker internetConnectionChecker;
  static ConnectionCheckerImpl get to => Get.find<ConnectionCheckerImpl>();

  final StreamController<bool> _streamController = StreamController<bool>();
  late final StreamSubscription<bool> _streamSubscription =
      _streamController.stream.asBroadcastStream().listen((event) => event);
  late StreamSubscription<InternetConnectionStatus> _internetConnectionStream;
  // @override
  Future<bool> get isConnected async =>
      await internetConnectionChecker.hasConnection;

  // @override
  Future<void> initializeNetworkStream() async {
    _internetConnectionStream = internetConnectionChecker.onStatusChange.listen(
      (event) {
        if (event == InternetConnectionStatus.connected) {
          _streamController.sink.add(true);
        } else {
          _streamController.sink.add(false);
        }
        debugPrint(" event >>> $event");
      },
    );
  }

  // @override
  StreamSubscription<bool> get listenToNetworkStream {
    if (_streamSubscription.isPaused) _streamSubscription.resume();
    print("listenToNetworkStream >>>>>>>> $_streamSubscription");
    return _streamSubscription;
  }

  Future<ConnectionCheckerImpl> init() async {
    await initializeNetworkStream();
    return this;
  }

  // @override
  Future<void> dispose() async {
    await _streamController.close();
    await _internetConnectionStream.cancel();
  }
}

/* abstract class ConnectionChecker extends GetxService {
  void initializeNetworkStream();
  StreamSubscription<bool> get listenToNetworkStream;
  Future<bool> get isConnected;
  Future<void> dispose();
}
 */
/* class ConnectionCheckerImpl extends GetxService {
  ConnectionCheckerImpl({required this.internetConnectionChecker});
  final InternetConnectionChecker internetConnectionChecker;
  static ConnectionCheckerImpl get to => Get.find<ConnectionCheckerImpl>();

  final StreamController<bool> _streamController = StreamController<bool>();
  late final StreamSubscription<bool> _streamSubscription =
      _streamController.stream.asBroadcastStream().listen((event) => event);
  late StreamSubscription<InternetConnectionStatus> _internetConnectionStream;
  // @override
  Future<bool> get isConnected async =>
      await internetConnectionChecker.hasConnection;

  // @override
  Future<void> initializeNetworkStream() async {
    _internetConnectionStream =
        internetConnectionChecker.onStatusChange.listen((event) {
      if (event == InternetConnectionStatus.connected) {
        _streamController.sink.add(true);
      } else {
        _streamController.sink.add(false);
      }
      debugPrint(" event >>> $event");
    });
  }

  // @override
  StreamSubscription<bool> get listenToNetworkStream {
    if (_streamSubscription.isPaused) _streamSubscription.resume();
    return _streamSubscription;
  }

  Future<ConnectionCheckerImpl> init() async {
    await initializeNetworkStream();
    return this;
  }

  // @override
  Future<void> dispose() async {
    await _streamController.close();
    await _internetConnectionStream.cancel();
  }
}
 */