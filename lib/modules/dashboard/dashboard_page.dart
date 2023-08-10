import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/colors_theme.dart';
import '../discover/discover_page.dart';
import '../home/home_page.dart';
import '../leaderboard/leaderboard_page.dart';
import '../profile/profile_page.dart';
import 'dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.find<DashboardController>();
    return Scaffold(
      backgroundColor: ThemeColor.white,
      extendBody: true,
      body: Obx(() => IndexedStack(
            index: dashboardController.selectedTabIndex.value,
            children: [
              HomePage(),
              DiscoverPage(),
              LeaderboardPage(),
              ProfilePage()
            ],
          )),
      bottomNavigationBar: Obx(() => ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              backgroundColor: ThemeColor.white,
              selectedFontSize: 12,
              selectedIconTheme:
                  IconThemeData(color: ThemeColor.primaryDark, size: 24),
              selectedItemColor: ThemeColor.primaryDark,
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              unselectedIconTheme:
                  IconThemeData(color: ThemeColor.grey, size: 24),
              unselectedItemColor: ThemeColor.grey,
              unselectedFontSize: 12,
              unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_rounded),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search_rounded),
                  label: "Discover",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.pie_chart_rounded),
                  label: "Leaderboard",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_rounded),
                  label: "Profile",
                ),
              ],
              currentIndex: dashboardController.selectedTabIndex.value,
              onTap: dashboardController.onItemTapped,
            ),
          )),
      bottomSheet: Container(
        height: 0,
        color: ThemeColor.white,
      ),
    );
  }
}
