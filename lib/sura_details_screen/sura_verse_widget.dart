import 'package:flutter/material.dart';
import 'package:islami_c15_mon_nahas/core/colors_manager.dart';

class SuraVerseWidget extends StatelessWidget {
   SuraVerseWidget({super.key, required this.verse});
  String verse;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: ColorsManager.gold.withOpacity(0.7)
      ),
      child: Text(verse, textAlign: TextAlign.center,textDirection: TextDirection.rtl,style: TextStyle(color: ColorsManager.black, fontWeight: FontWeight.w500, fontSize: 18),),
    );
  }
}
