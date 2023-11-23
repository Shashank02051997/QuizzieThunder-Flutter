import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../models/signin_response_model.dart';
import '../routes/app_routes.dart';
import '../theme/colors_theme.dart';
import 'constants.dart';
import 'enums/snackbar_status.dart';

class AppUtils {
  static void showSnackBar(String message,
      {String title = "Error", MessageStatus status = MessageStatus.NORMAL}) {
    Color backgroundColor;
    switch (status) {
      case MessageStatus.SUCCESS:
        backgroundColor = ThemeColor.green;
        break;
      case MessageStatus.ERROR:
        backgroundColor = ThemeColor.red;
        break;
      case MessageStatus.WARNING:
        backgroundColor = ThemeColor.orange;
        break;
      case MessageStatus.NORMAL:
      default:
        backgroundColor = ThemeColor.black;
        break;
    }

    Get.snackbar(
      title,
      message,
      borderRadius: 4,
      snackPosition: SnackPosition.BOTTOM,
      colorText: ThemeColor.white,
      backgroundColor: backgroundColor,
    );
  }

  static SignInResponseModel loginUserDetail() {
    return SignInResponseModel.fromJson((GetStorage().read(KEY_USER_DATA)));
  }

  static String getNameInitials(String name) {
    List<String> names = name.split(" ");
    String initials = "";
    int numWords = names.length > 2 ? 2 : names.length;
    for (int i = 0; i < numWords; i++) {
      String initial = names[i][0].toUpperCase();
      initials += initial;
    }
    return initials;
  }

  static Future<Map<String, String>> getAppDetails() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    final version = packageInfo.version;
    final buildNumber = packageInfo.buildNumber;
    final buildSignature = packageInfo.buildSignature;
    final appName = packageInfo.appName;
    final packageName = packageInfo.packageName;
    final installerStore = packageInfo.installerStore;

    print("App version = $version");
    return {"version": version, "buildNumber": buildNumber};
  }

  static Color getRandomAvatarBgColor() {
    final List<Color> randomColors = [
      Color(0xffC9F2E9),
      Color(0xffC4D0FB),
      Color(0xffBF83FF),
      Color(0xffFFD6DD),
    ];
    final random = Random();
    return randomColors[random.nextInt(randomColors.length)];
  }

  static Color getRandomCardBgColor() {
    final List<Color> randomColors = [
      Color(0xff8891AA),
      Color(0xff88E2CE),
      Color(0xff9087E5),
      Color(0xffF0A2D4),
      Color(0xffF7D37A),
      Color(0xff9DE2B8),
      Color(0xffF5928B),
      Color(0xffA6C1E7),
      Color(0xffFFB478),
      Color(0xffC9A7C1),
      Color(0xff6DD7D3)
    ];
    final random = Random();
    return randomColors[random.nextInt(randomColors.length)];
  }

  static void logout() async {
    await GetStorage().remove(KEY_USER_DATA);
    Get.offAllNamed(AppRoutes.signInPage);
  }

  static String getGreeting() {
    var now = DateTime.now();
    if (now.hour >= 0 && now.hour < 12) {
      return "GOOD MORNING";
    } else if (now.hour >= 12 && now.hour < 17) {
      return "GOOD AFTERNOON";
    } else {
      return "GOOD EVENING";
    }
  }

  static Future<void> shareImageFromApi({
    required String imageUrl,
    required String text,
    required String subject,
  }) async {
    // Download the image from the API link.
    final response = await http.get(Uri.parse(imageUrl));

    // Get the temporary directory on the device.
    final tempDir = await getTemporaryDirectory();

    // Create a file with a unique name in the temporary directory.
    const tempFileName = 'image.png';
    final tempFile = File('${tempDir.path}/$tempFileName');

    // Write the downloaded image data to the temporary file.
    await tempFile.writeAsBytes(response.bodyBytes);

    // Share the temporary image file using Share.shareXFiles.
    await Share.shareXFiles([XFile(tempFile.path)],
        subject: subject, text: text);

    // Delete the temporary image file.
    await tempFile.delete();
  }

  static Future<void> downloadImage(String url, String fileName) async {
    try {
      // Download image
      final http.Response response = await http.get(Uri.parse(url));

      // Get temporary directory
      final dir = await getTemporaryDirectory();

      // Create an image name
      var filename = '${dir.path}/$fileName';

      // Save to filesystem
      final file = File(filename);
      await file.writeAsBytes(response.bodyBytes);

      // Ask the user to save it
      final params = SaveFileDialogParams(sourceFilePath: file.path);
      final finalPath = await FlutterFileDialog.saveFile(params: params);

      if (finalPath != null) {
        showSnackBar("Image saved to disk",
            title: "Success", status: MessageStatus.SUCCESS);
      }
    } catch (e) {
      showSnackBar("An error occurred while saving the image",
          title: "Error", status: MessageStatus.ERROR);
    }
  }
}
