import 'package:flutter/material.dart';
import 'package:islami_c15_mon_nahas/config/theme/theme_manager.dart';
import 'package:islami_c15_mon_nahas/core/colors_manager.dart';
import 'package:islami_c15_mon_nahas/core/routes_manager/routes_manager.dart';
import 'package:islami_c15_mon_nahas/splash/spalsh_screen.dart';

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     routes: RoutesManager.routes,
     initialRoute: RoutesManager.splashRoute,
     theme: ThemeManager.light

   );
  }
}
