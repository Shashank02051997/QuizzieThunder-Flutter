import 'package:get/get.dart';

import '../modules/dashboard/dashboard_binding.dart';
import '../modules/dashboard/dashboard_page.dart';
import '../modules/forgot_password/forgot_password_binding.dart';
import '../modules/forgot_password/forgot_password_page.dart';
import '../modules/new_password/new_password_binding.dart';
import '../modules/new_password/new_password_page.dart';
import '../modules/quizzes/quizzes_binding.dart';
import '../modules/quizzes/quizzes_page.dart';
import '../modules/settings/settings_binding.dart';
import '../modules/settings/settings_page.dart';
import '../modules/signin/signin_binding.dart';
import '../modules/signin/signin_page.dart';
import '../modules/signup/signup_binding.dart';
import '../modules/signup/signup_page.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_page.dart';
import '../modules/update_profile/update_profile_binding.dart';
import '../modules/update_profile/update_profile_page.dart';
import '../modules/verify_otp/verify_otp_binding.dart';
import '../modules/verify_otp/verify_otp_page.dart';
import '../modules/welcome/welcome_binding.dart';
import '../modules/welcome/welcome_page.dart';
import 'app_routes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashPage,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.welcomePage,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: AppRoutes.signInPage,
      page: () => SigninPage(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: AppRoutes.forgotPasswordPage,
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.newPasswordPage,
      page: () => NewPasswordPage(),
      binding: NewPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.signUpPage,
      page: () => SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: AppRoutes.verifyOtpPage,
      page: () => VerifyOtpPage(),
      binding: VerifyOtpBinding(),
    ),
    GetPage(
      name: AppRoutes.dashboardPage,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: AppRoutes.settingsPage,
      page: () => SettingsPage(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: AppRoutes.quizzesPage,
      page: () => QuizzesPage(),
      binding: QuizzesBinding(),
    ),
    GetPage(
      name: AppRoutes.updateProfilePage,
      page: () => UpdateProfilePage(),
      binding: UpdateProfileBinding(),
    ),
  ];
}
