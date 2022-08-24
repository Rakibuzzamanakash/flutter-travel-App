import 'package:get/get.dart';
import 'package:travel_app/ui/views/auth/sign_in.dart';
import 'package:travel_app/ui/views/auth/sign_up.dart';
import 'package:travel_app/ui/views/onboarding_screen.dart';
import 'package:travel_app/ui/views/splash_screen.dart';

const String splash = "/splash-screen";
const String onboarding = "/onboarding-screen";
const String signup = "/signup-screen";
const String signin = "/signin-screen";

//control our page routes

List<GetPage> getPages = [
  GetPage(name: splash, page: () => SplashScreen()),

  GetPage(name: onboarding, page: () => OnboardingScreen()),

  GetPage(name: signup, page: () => SignUp()),

  GetPage(name: signin, page: () => SignIn()),
];
