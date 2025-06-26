import 'package:flutter/material.dart';
import 'package:islami_c15_mon_nahas/core/assets_manager.dart';
import 'package:islami_c15_mon_nahas/core/colors_manager.dart';

class MostRecentItem extends StatelessWidget {
  const MostRecentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
          color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(20)
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Al-Fatiha", style: TextStyle(color: ColorsManager.black, fontSize: 24, fontWeight: FontWeight.bold),)
              ,Text("الفاتحه", style: TextStyle(color: ColorsManager.black, fontSize: 24, fontWeight: FontWeight.bold),)
              ,Text("7 Verses  ", style: TextStyle(color: ColorsManager.black, fontSize: 14, fontWeight: FontWeight.bold),)
            ],
          ),
          Image.asset(AssetsManager.mostRecentCardImage)
        ],
      ),

    );
  }
}
