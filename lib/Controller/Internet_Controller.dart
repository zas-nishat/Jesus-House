import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> connectivityResults) {
    final ConnectivityResult connectivityResult = connectivityResults.last;

    if (connectivityResult == ConnectivityResult.none) {
      Get.rawSnackbar(
        messageText: const Text(
          'Something went wrong. Please connect to internet',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        isDismissible: false,
        duration: const Duration(days: 1),
        icon: const Icon(Icons.wifi_off, color: Colors.red),
        margin: EdgeInsets.zero,
        snackStyle: SnackStyle.GROUNDED,
      );
    } else {
      if (Get.isSnackbarOpen) {
        Get.rawSnackbar(
          messageText: const Text(
            'Your internet connection restored.',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          isDismissible: true,
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.green,
          snackStyle: SnackStyle.GROUNDED,
        );
        Get.closeCurrentSnackbar();
      }
    }
  }
}
