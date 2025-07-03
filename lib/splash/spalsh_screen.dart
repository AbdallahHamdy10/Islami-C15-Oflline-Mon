import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami_c15_mon_nahas/core/colors_manager.dart';
import 'package:islami_c15_mon_nahas/core/routes_manager/routes_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, RoutesManager.onBoardingRoute);

    },);

    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(
              flex: 3,
            ),
            SvgPicture.asset("assets/images/islami_logo.svg"),
         Spacer(
           flex: 1,
         ),
            Image.asset("assets/images/branding_image.png",),
            Spacer(flex: 1,)
          ],
        ),
      ),

    );

  }
}
