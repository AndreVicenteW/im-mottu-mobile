import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class EventChannelConnection {
  static const EventChannel _eventChannel = EventChannel(
      "br.com.andrevicente.immottumobile.im_mottu_mobile/connection");

  static void startListeningConnection() {
    _eventChannel.receiveBroadcastStream().listen((dynamic isConnected) {
      if (Get.isSnackbarOpen == true && isConnected) {
        Get.back();
      } else if (!isConnected) {
        Get.snackbar(
          "Atenção",
          "Sem conexão com a internet",
          isDismissible: false,
          duration: const Duration(days: 1),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }, onError: (dynamic error) {
      debugPrint("Error: $error");
    });
  }
}
