import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/const/app_colors.dart';
import 'package:travel_app/const/app_string.dart';
import 'package:travel_app/ui/route/route.dart';
import 'package:travel_app/ui/views/splash_screen.dart';

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
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(428, 926),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppString.appName,
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                centerTitle: true,
                elevation: 0,
                titleTextStyle: TextStyle(color: Colors.black),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: AppColors.scaffoldColor,
              textTheme: GoogleFonts.poppinsTextTheme(
                  Theme.of(context).textTheme.apply()
              )
          ),
          initialRoute: splash,
          getPages: getPages,
          home: SplashScreen(),
        );
      },
    );
  }
}

