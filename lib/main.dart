import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:travel_app/business_logics/app_languages.dart';
import 'package:travel_app/const/app_string.dart';
import 'package:travel_app/theme/app_theme.dart';
import 'package:travel_app/ui/route/route.dart';
import 'package:travel_app/ui/views/splash_screen.dart';

final _themedata = GetStorage();
void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    name: "flutter_travel_app",
    options: FirebaseOptions(
        apiKey: "AIzaSyDeF7CUujLGviOdAhV1i2t6RLEECYwxuF8",
        appId: "1:440584070210:android:74cae0334bd7528f65f9db",
        messagingSenderId: "440584070210",
        projectId: "flutter-travel-app-68f44"
    ),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

        future: _initialization,
        builder: (context , snapshot){
          if(snapshot.hasError){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.connectionState == ConnectionState.done){
            return MyApp();
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        }
    );
  }
}

class MyApp extends StatelessWidget {

final bool _darkMode = _themedata.read('darkmode') ?? false;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 926),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppString.appName,
          translations: AppLanguages(),
          locale: Locale('en','US'),
          fallbackLocale: Locale('en','US'),
          theme: _darkMode? AppTheme().darkTheme():AppTheme().lightTheme(),
          initialRoute: splash,
          getPages: getPages,
          home: SplashScreen(),
        );
      },
    );
  }
}

