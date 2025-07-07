import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami_c15_mon_nahas/core/colors_manager.dart';
import 'package:islami_c15_mon_nahas/core/prefs_manager/prefs_manager.dart';
import 'package:islami_c15_mon_nahas/core/routes_manager/routes_manager.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late List<PageViewModel> pages;

  late TextStyle bodyStyle = TextStyle(
    fontSize: 19.0,
    color: ColorsManager.gold,
    fontWeight: FontWeight.w600,
  );

  late PageDecoration pageDecoration = PageDecoration(
    imageAlignment: Alignment.bottomCenter,
    bodyAlignment: Alignment.bottomCenter,
    contentMargin: EdgeInsets.all(20),
    pageMargin: EdgeInsets.all(20),
    footerFit: FlexFit.tight,
    footerPadding: EdgeInsets.all(20),
    footerFlex: 50,
    bodyFlex: 2,
    imageFlex: 2,
    titleTextStyle: TextStyle(
      color: ColorsManager.gold,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    ),
    bodyTextStyle: bodyStyle,
    bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    pageColor: ColorsManager.black,
    imagePadding: EdgeInsets.zero,
  );



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pages = [
      PageViewModel(
        title: "Welcome To Islmi App",
        body: "",
        image: _buildImage('onboarding_image_1.png'),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: "We Are Very Excited To Have You In Our Community",
        body: "",
        image: _buildImage('onboarding_image_2.png'),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: "Reading the Quran",
        body: "Read, and your Lord is the Most Generous",
        image: _buildImage('onboarding_image_3.png'),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: "Bearish",
        body: "Praise the name of your Lord, the Most High",
        image: _buildImage('onboarding_image_4.png'),
        decoration: pageDecoration,
      ),
      PageViewModel(
        title: "Holy Quran Radio",
        body:
            "You can listen to the Holy Quran Radio through the application for free and easily",
        image: _buildImage('onboarding_image_5.png'),
        decoration: pageDecoration,
      ),
    ];
  }

  Widget _buildImage(String assetName, [double width = 0]) {
    return Image.asset('assets/images/$assetName', alignment: Alignment.center);
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: ColorsManager.black,

      // globalHeader: Container(
      //   height: 100,
      //     width: 100,
      //     alignment: Alignment.center,
      //     padding: EdgeInsets.all(12),
      //     margin: EdgeInsets.symmetric(vertical: 20),
      //     child: Image.asset("assets/images/quran_tab_logo.png", )),
      pages: pages,

      next: Text(
        "Next",
        style: TextStyle(
          color: ColorsManager.gold,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      done: Text(
        "Finish",
        style: TextStyle(
          color: ColorsManager.gold,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      showSkipButton: true,
      onSkip: () {
        Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
      },
      skip: Text("Skip", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Colors.red),),

      showDoneButton: true,
      showBackButton: true,
      back: Text(
        "Back",
        style: TextStyle(
          color: ColorsManager.gold,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onDone: () {
        Navigator.pushReplacementNamed(context, RoutesManager.mainLayout);
      },
      dotsFlex: 2,
      curve: Curves.fastLinearToSlowEaseIn,
      // controlsMargin: const EdgeInsets.all(16),
      // //controlsPadding: kIsWeb
      //     ? const EdgeInsets.all(12.0)
      //     : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(18, 7),

        // spacing: EdgeInsets.symmetric(horizontal: 5),
        color: Color(0xFF707070),
        activeColor: ColorsManager.gold,
        activeSize: Size(7, 7),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
