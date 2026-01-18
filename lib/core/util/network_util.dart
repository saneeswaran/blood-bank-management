import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkInternetConnection = StreamProvider<bool>(
  (ref) => NetworkUtil.isOnlineStream(),
);

class NetworkUtil {
  static Stream<bool> isOnlineStream() {
    return Connectivity().onConnectivityChanged.map(
      (event) => event != ConnectivityResult.none,
    );
  }
}
