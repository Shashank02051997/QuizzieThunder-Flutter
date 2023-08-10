import 'package:get/get.dart';

import '../discover/discover_controller.dart';
import '../home/home_controller.dart';
import '../leaderboard/leaderboard_controller.dart';
import '../profile/profile_controller.dart';
import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => DiscoverController());
    Get.lazyPut(() => LeaderboardController());
    Get.lazyPut(() => ProfileController());
  }
}
