import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/all_avatar_response_model.dart';
import '../theme/colors_theme.dart';
import '../utils/app_utils.dart';

class ChooseAvatarBottomSheet extends StatelessWidget {
  final List<Avatar> allAvatars;
  final Function(String val) onTap;

  const ChooseAvatarBottomSheet(
      {Key? key, required this.allAvatars, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 80,
                  child: Divider(
                      height: 4,
                      thickness: 4,
                      indent: 0,
                      endIndent: 0,
                      color: ThemeColor.grey_300),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                itemCount: allAvatars.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      onTap.invoke(allAvatars[index].url ?? "");
                      Get.back();
                    },
                    child: CircleAvatar(
                      backgroundColor: AppUtils.getRandomAvatarBgColor(),
                      radius: 20,
                      child: ClipOval(
                        child: CachedNetworkImage(
                          imageUrl: "${allAvatars[index].url}",
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
                  );
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
              ),
            )
          ]),
    );
  }
}
