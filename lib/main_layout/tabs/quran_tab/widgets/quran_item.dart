import 'dart:io';

import 'package:flutter/material.dart';
import 'package:islami_c15_mon_nahas/core/prefs_manager/prefs_manager.dart';
import 'package:islami_c15_mon_nahas/core/routes_manager/routes_manager.dart';
import 'package:islami_c15_mon_nahas/core/sura_model.dart';
import 'package:islami_c15_mon_nahas/main_layout/tabs/quran_tab/widgets/most_recent_widget.dart';

class QuranItem extends StatelessWidget {
   QuranItem({super.key,required this.suraModel, required this.index, required this.mostRecentWidgetKey});
SuraModel suraModel;
int index;
GlobalKey<MostRecentWidgetState> mostRecentWidgetKey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {;
     int realSuraIndex = int.parse(suraModel.suraIndex);
        PrefsManager.saveSuraIndex(realSuraIndex);
        Navigator.pushNamed(context,RoutesManager.quranDetails,

        arguments: SuraDetailsArguments(suraModel: suraModel,  mostRecentWidgetKey: mostRecentWidgetKey)
        );
      },
      child: Row(

        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset("assets/images/sura_num_bg.png"),
              Text("${index + 1}", style: TextStyle(color: Colors.white),),
            ],
          ),
         SizedBox(width: 16,),
         Column(
           children: [
             Text(suraModel.suraNameEn, style: TextStyle(color: Colors.white),),
             Text("${suraModel.versesNum}", style: TextStyle(color: Colors.white),)
           ],
         ),
      Spacer(),
          Text(suraModel.suraNameAr, style: TextStyle(color: Colors.white),),

        ],
      ),
    );
  }
}

class SuraDetailsArguments{
  SuraModel suraModel;

  GlobalKey<MostRecentWidgetState>? mostRecentWidgetKey;
  SuraDetailsArguments({required this.suraModel,  this.mostRecentWidgetKey});
}
