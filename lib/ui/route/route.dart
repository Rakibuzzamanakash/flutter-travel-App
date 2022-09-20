import 'package:get/get.dart';
import 'package:travel_app/Drawer_pages/how_to_use.dart';
import 'package:travel_app/Drawer_pages/privacy.dart';
import 'package:travel_app/Drawer_pages/settings.dart';
import 'package:travel_app/Drawer_pages/support.dart';
import 'package:travel_app/pages/nav_add_last_step.dart';
import 'package:travel_app/pages/search_screen.dart';
import 'package:travel_app/ui/views/auth/sign_in.dart';
import 'package:travel_app/ui/views/auth/sign_up.dart';
import 'package:travel_app/ui/views/details_screen.dart';
import 'package:travel_app/ui/views/home.dart';
import 'package:travel_app/ui/views/onboarding_screen.dart';
import 'package:travel_app/ui/views/privacy_policy.dart';
import 'package:travel_app/ui/views/profile.dart';
import 'package:travel_app/ui/views/splash_screen.dart';
import 'package:travel_app/ui/views/user_form.dart';
import 'package:travel_app/ui/widgets/see_all_screen.dart';

import '../../Drawer_pages/faq.dart';

const String splash = "/splash-screen";
const String onboarding = "/onboarding-screen";
const String signup = "/signup-screen";
const String signin = "/signin-screen";
const String userform = "/userform-screen";
const String privacypolicy = "/privacypolicy-screen";
const String homePage = "/HomePage-screen";
const String privacyScreen = "/privacy-screen";
const String supportScreen = "/support-screen";
const String faqScreen = "/faq-screen";
const String howtouseScreen = "/how_to_use-screen";
const String settingsScreen = "/settings-screen";
const String searchScreen = "/search-screen";
const String seeAllScreen = "/seeAll-screen";
const String detailsScreen = "/details-screen";
const String navAddLastStep = "/navAddLastStep-screen";
const String userProfile = "/userProfile-screen";

//control our page routes

List<GetPage> getPages = [
  GetPage(name: splash, page: () => SplashScreen()),

  GetPage(name: onboarding, page: () => OnboardingScreen()),

  GetPage(name: signup, page: () => SignUp()),

  GetPage(name: signin, page: () => SignIn()),

  GetPage(name: userform, page: () => UserForm()),

  GetPage(name: privacypolicy, page: () => PrivacyPoliacy()),

  GetPage(name: homePage, page: () => HomePage()),

  GetPage(name: supportScreen, page: () => SupportScreen()),

  GetPage(name: privacyScreen, page: () => PrivacyScreen()),

  GetPage(name: faqScreen, page: () => FaqScreen()),

  GetPage(name: howtouseScreen, page: () => HowToUseScreen()),

  GetPage(name: settingsScreen, page: () => SettingsScreen()),

  GetPage(name: searchScreen, page: () => SearchScreen()),

  GetPage(name: seeAllScreen, page: () => SeeAllSreen()),

  GetPage(name: detailsScreen, page: () => DetailsScreen()),

  GetPage(name: navAddLastStep, page: () => NavAddLastStep()),

  GetPage(name: userProfile, page: () => UserProfile()),
];
