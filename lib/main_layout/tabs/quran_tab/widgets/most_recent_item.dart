import 'package:flutter/material.dart';
import 'package:islami_c15_mon_nahas/core/assets_manager.dart';
import 'package:islami_c15_mon_nahas/core/colors_manager.dart';
import 'package:islami_c15_mon_nahas/core/routes_manager/routes_manager.dart';
import 'package:islami_c15_mon_nahas/core/sura_model.dart';
import 'package:islami_c15_mon_nahas/main_layout/tabs/quran_tab/widgets/quran_item.dart';

class MostRecentItem extends StatelessWidget {
   MostRecentItem({super.key, required this.suraModel});
  SuraModel suraModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, RoutesManager.quranDetails, arguments: SuraDetailsArguments(suraModel: suraModel,));
      },
      child: Container(
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
                Text(suraModel.suraNameEn, style: TextStyle(color: ColorsManager.black, fontSize: 24, fontWeight: FontWeight.bold),)
                ,Text(suraModel.suraNameAr, style: TextStyle(color: ColorsManager.black, fontSize: 24, fontWeight: FontWeight.bold),)
                ,Text(suraModel.versesNum.toString(), style: TextStyle(color: ColorsManager.black, fontSize: 14, fontWeight: FontWeight.bold),)
              ],
            ),
            Image.asset(AssetsManager.mostRecentCardImage)
          ],
        ),

      ),
    );
  }
}
