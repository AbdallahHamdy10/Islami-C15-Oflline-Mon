import 'package:flutter/cupertino.dart';
import 'package:islami_c15_mon_nahas/main_layout/main_layout.dart';
import 'package:islami_c15_mon_nahas/splash/spalsh_screen.dart';
import 'package:islami_c15_mon_nahas/sura_details_screen/sura_details_screen.dart';

class RoutesManager {
  static const String splashRoute = '/splash';
  static const String mainLayout = '/mainLayout';
  static const String quranDetails = '/quranDetails';

  static Map<String, WidgetBuilder> routes = {
  splashRoute : (context) => SplashScreen(),
    mainLayout : (context)=> MainLayout(),
    quranDetails : (context)=>SuraDetailsScreen()
};

}