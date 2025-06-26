import 'package:flutter/material.dart';
import 'package:islami_c15_mon_nahas/core/colors_manager.dart';
import 'package:islami_c15_mon_nahas/main_layout/tabs/hadith_tab/hadith_tab.dart';
import 'package:islami_c15_mon_nahas/main_layout/tabs/quran_tab/quran_tab.dart';
import 'package:islami_c15_mon_nahas/main_layout/tabs/radio_tab/radio_tab.dart';
import 'package:islami_c15_mon_nahas/main_layout/tabs/tasbeeh_tab/tasbeeh_tab.dart';
import 'package:islami_c15_mon_nahas/main_layout/tabs/time_tab/time_tab.dart';

class MainLayout extends StatefulWidget {
  MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> tabs = [
    QuranTab(),
    HadithTab(),
    TasbehTab(),
    RadioTab(),
    TimeTab(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/quran_tab_bg.png"),
        ),
      ),
      child: Scaffold(
        body: tabs[selectedIndex],
        bottomNavigationBar: buildBottomNavBar(),
      ),
    );
  }

  Widget buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: _onTab,

      items: [
        BottomNavigationBarItem(
          icon: buildIconWidget(
            "quran_icon.png",
            isSelected: selectedIndex == 0,
          ),
          label: "Quran",
        ),
        BottomNavigationBarItem(
          icon: buildIconWidget(
            "hadith_icon.png",
            isSelected: selectedIndex == 1,
          ),
          label: "Hadith",
        ),

        BottomNavigationBarItem(
          icon: buildIconWidget(
            "sebha_icon.png",
            isSelected: selectedIndex == 2,
          ),
          label: "Tasbeeh",
        ),
        BottomNavigationBarItem(
          icon: buildIconWidget(
            "radio_icon.png",
            isSelected: selectedIndex == 3,
          ),
          label: "radio",
        ),
        BottomNavigationBarItem(
          icon: buildIconWidget(
            "time_icon.png",
            isSelected: selectedIndex == 4,
          ),
          label: "Time",
        ),
      ],
    );
  }

  void _onTab(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  Widget buildIconWidget(String imageName, {required bool isSelected}) {
    return isSelected
        ? Container(
          padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
          decoration: BoxDecoration(
            color: ColorsManager.black.withOpacity(0.6),
            borderRadius: BorderRadius.circular(66),
          ),
          child: ImageIcon(AssetImage("assets/images/$imageName")),
        )
        : ImageIcon(AssetImage("assets/images/$imageName"));
  }
}
