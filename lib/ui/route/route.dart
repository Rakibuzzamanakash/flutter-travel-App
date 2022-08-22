import 'package:get/get.dart';
import 'package:travel_app/ui/views/onboarding_screen.dart';
import 'package:travel_app/ui/views/splash_screen.dart';

const String splash = "/splash-screen";
const String onboarding = "/onboarding-screen";

//control our page routes

List<GetPage> getPages = [
  GetPage(name: splash, page: () => SplashScreen()),

  GetPage(name: onboarding, page: () => OnboardingScreen()),
];
