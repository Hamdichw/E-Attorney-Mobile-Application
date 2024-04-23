import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:estichara/view/nav_bar.dart';
import 'package:get/get.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/first_screens/screen4.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  bool open = false;
  @override
  void onInit() async {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionsStatus);
  }

  void _updateConnectionsStatus(
      List<ConnectivityResult> connectivityResults) async {
    var connectivityResult = connectivityResults.last;
    if (connectivityResult == ConnectivityResult.none) {
      /* Get.snackbar("Fail to connect", "PLEASE CONNECT TO THE INTERNET",
          isDismissible: false,
          duration: Duration(days: 1),
          backgroundColor: Colors.red[400],
          icon: Icon(
            Icons.wifi_off,
            color: Colors.white,
            size: 35,
          ),
          snackStyle: SnackStyle.FLOATING); */
      open = true;
      QuickAlert.show(
          context: Get.context!,
          title: 'Fail to connect!',
          text: "PLEASE CONNECT TO THE INTERNET",
          type: QuickAlertType.error,
          showConfirmBtn: false,
          disableBackBtn: true);
    } else {
      /*  if (Get.isSnackbarOpen) {
        Get.closeCurrentSnackbar();
      } */
      if (open) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var isLoggedIn = prefs.getBool('isLoggedIn');
        if (isLoggedIn == true) {
          Get.offAll(NavBar());
        } else {
          Get.offAll(Screen4());
        }
        open = false;
      }
      //
    }
  }
}
