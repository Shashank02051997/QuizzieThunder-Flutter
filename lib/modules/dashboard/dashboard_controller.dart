import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedTabIndex = 0.obs;

  void onItemTapped(int index) {
    selectedTabIndex.value = index;
  }
}
