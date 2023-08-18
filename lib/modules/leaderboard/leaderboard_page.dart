import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzie_thunder/utils/app_utils.dart';

import '../../models/leaderboard_screen_response_model.dart';
import '../../theme/colors_theme.dart';
import 'leaderboard_controller.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LeaderboardController leaderboardController =
        Get.find<LeaderboardController>();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Leaderboard",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: ThemeColor.white),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
        ),
        backgroundColor: ThemeColor.primary,
        body: Obx(() => leaderboardController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                color: ThemeColor.white,
              ))
            : Column(
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ThemeColor.primaryDark,
                          borderRadius: BorderRadius.circular(16)),
                      padding: const EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                leaderboardController.selectedTabIndex.value =
                                    0;
                              },
                              child: leaderboardController
                                          .selectedTabIndex.value ==
                                      0
                                  ? Container(
                                      decoration: BoxDecoration(
                                          color: ThemeColor.lightPrimary,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      child: Text(
                                        "Weekly",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: ThemeColor.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ))
                                  : Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      child: Text(
                                        "Weekly",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: ThemeColor.white
                                                .withOpacity(0.6),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                leaderboardController.selectedTabIndex.value =
                                    1;
                              },
                              child: leaderboardController
                                          .selectedTabIndex.value ==
                                      1
                                  ? Container(
                                      decoration: BoxDecoration(
                                          color: ThemeColor.lightPrimary,
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      child: Text(
                                        "All Time",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: ThemeColor.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ))
                                  : Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16, vertical: 8),
                                      child: Text(
                                        "All Time",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: ThemeColor.white
                                                .withOpacity(0.6),
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  leaderboardController.selectedTabIndex.value == 0
                      ? weeklyLeaderboard(leaderboardController)
                      : allTimeLeaderboard(leaderboardController)
                ],
              )));
  }

  Expanded allTimeLeaderboard(LeaderboardController leaderboardController) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/all_time_leaderboard_bg.png",
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 32,
                            ),
                            allTimeWinnerInfo(leaderboardController
                                .leaderboardScreenResponseModel
                                ?.allTimeLeaderboard?[1]),
                          ],
                        ),
                        allTimeWinnerInfo(leaderboardController
                            .leaderboardScreenResponseModel
                            ?.allTimeLeaderboard?[0]),
                        Column(
                          children: [
                            SizedBox(
                              height: 64,
                            ),
                            allTimeWinnerInfo(leaderboardController
                                .leaderboardScreenResponseModel
                                ?.allTimeLeaderboard?[2]),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                  decoration: BoxDecoration(
                      color: ThemeColor.lighterPrimary,
                      borderRadius: BorderRadius.circular(20)),
                  child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 12);
                      },
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: leaderboardController
                              .leaderboardScreenResponseModel
                              ?.allTimeLeaderboard
                              ?.length ??
                          0,
                      itemBuilder: (context, index) {
                        return userQuizPointsInfoContainter(
                            index,
                            leaderboardController.leaderboardScreenResponseModel
                                ?.allTimeLeaderboard?[index]);
                      }),
                )),
          ],
        ),
      ),
    );
  }

  Column allTimeWinnerInfo(Leaderboard? leaderboard) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: AppUtils.getRandomAvatarBgColor(),
          radius: 24,
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: "${leaderboard?.user?.profilePic}",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Center(
                child: Container(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: ThemeColor.accent,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                color: ThemeColor.red,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "${leaderboard?.user?.firstname} ${leaderboard?.user?.lastname}"
                      .length >
                  10
              ? "${leaderboard?.user?.firstname} ${leaderboard?.user?.lastname}"
                      .substring(0, 10) +
                  "..."
              : "${leaderboard?.user?.firstname} ${leaderboard?.user?.lastname}",
          style: TextStyle(
              color: ThemeColor.white,
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(
              color: ThemeColor.lightPrimary,
              borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            "${leaderboard?.points} QP",
            style: TextStyle(
                color: ThemeColor.white.withOpacity(0.8),
                fontSize: 12,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Expanded weeklyLeaderboard(LeaderboardController leaderboardController) {
    return Expanded(
      child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 24),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
            decoration: BoxDecoration(
                color: ThemeColor.lighterPrimary,
                borderRadius: BorderRadius.circular(20)),
            child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 12);
                },
                scrollDirection: Axis.vertical,
                itemCount: leaderboardController.leaderboardScreenResponseModel
                        ?.weeklyLeaderboard?.length ??
                    0,
                itemBuilder: (context, index) {
                  return userQuizPointsInfoContainter(
                      index,
                      leaderboardController.leaderboardScreenResponseModel
                          ?.weeklyLeaderboard?[index]);
                }),
          )),
    );
  }

  Container userQuizPointsInfoContainter(int index, Leaderboard? leaderboard) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ThemeColor.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 32,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ThemeColor.grey_400,
                      )),
                  child: Text(
                    "${index + 1}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: ThemeColor.grey_600),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                CircleAvatar(
                  backgroundColor: AppUtils.getRandomAvatarBgColor(),
                  radius: 24,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: "${leaderboard?.user?.profilePic}",
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Center(
                        child: Container(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: ThemeColor.accent,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(
                        Icons.error,
                        color: ThemeColor.red,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${leaderboard?.user?.firstname} ${leaderboard?.user?.lastname}",
                        softWrap: false,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ThemeColor.black),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "${leaderboard?.points} points",
                        style:
                            TextStyle(fontSize: 14, color: ThemeColor.grey_500),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Visibility(
            visible: index < 3,
            child: Image.asset(
              index == 0
                  ? "assets/images/gold_badge.png"
                  : index == 1
                      ? "assets/images/silver_badge.png"
                      : "assets/images/bronze_badge.png",
              width: 28,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
