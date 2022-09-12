import 'package:get/get.dart';
import 'package:travel_app/ui/views/auth/sign_in.dart';
import 'package:travel_app/ui/views/auth/sign_up.dart';
import 'package:travel_app/ui/views/home.dart';
import 'package:travel_app/ui/views/onboarding_screen.dart';
import 'package:travel_app/ui/views/privacy_policy.dart';
import 'package:travel_app/ui/views/splash_screen.dart';
import 'package:travel_app/ui/views/user_form.dart';

const String splash = "/splash-screen";
const String onboarding = "/onboarding-screen";
const String signup = "/signup-screen";
const String signin = "/signin-screen";
const String userform = "/userform-screen";
const String privacypolicy = "/privacypolicy-screen";
const String homePage = "/HomePage-screen";

//control our page routes

List<GetPage> getPages = [
  GetPage(name: splash, page: () => SplashScreen()),

  GetPage(name: onboarding, page: () => OnboardingScreen()),

  GetPage(name: signup, page: () => SignUp()),

  GetPage(name: signin, page: () => SignIn()),

  GetPage(name: userform, page: () => UserForm()),

  GetPage(name: privacypolicy, page: () => PrivacyPoliacy()),

  GetPage(name: homePage, page: () => HomePage()),
];
