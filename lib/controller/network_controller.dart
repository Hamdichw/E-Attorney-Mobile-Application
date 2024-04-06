import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionsStatus);
  }

  void _updateConnectionsStatus(List<ConnectivityResult> connectivityResults) {
    var connectivityResult = connectivityResults.last;
    if (connectivityResult == ConnectivityResult.none) {
      Get.snackbar("Fail to connect", "PLEASE CONNECT TO THE INTERNET",
          isDismissible: false,
          duration: Duration(days: 1),
          backgroundColor: Colors.red[400],
          icon: Icon(
            Icons.wifi_off,
            color: Colors.white,
            size: 35,
          ),
          snackStyle: SnackStyle.FLOATING);
    } else {
      if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      }
    }
  }
}
