import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'modules/splash/splash_binding.dart';
import 'modules/splash/splash_page.dart';
import 'routes/app_pages.dart';
import 'theme/colors_theme.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Quizzie Thunder App',
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
      ).copyWith(
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: ThemeColor.primaryDark)),
      home: SplashPage(),
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
    );
  }
}
