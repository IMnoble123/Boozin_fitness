import 'package:boozinfitnessapp/features/home/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/home/screens/home_binding.dart';
import 'features/splash/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Flutter Blueprint',
          theme: ThemeData(
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
          ),
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.route,
          getPages: [
            GetPage(
              name: SplashScreen.route,
              page: () => const SplashScreen(),
            ),
            GetPage(
              name: HomeScreen.route,
              page: () => const HomeScreen(),
              binding: HomeBinding(),
              transition: Transition.cupertino,
            ),
          ],
        );
      },
    );
  }
}


