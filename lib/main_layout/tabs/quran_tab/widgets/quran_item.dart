import 'package:flutter/material.dart';
import 'package:islami_c15_mon_nahas/core/routes_manager/routes_manager.dart';
import 'package:islami_c15_mon_nahas/core/sura_model.dart';

class QuranItem extends StatelessWidget {
   QuranItem({super.key,required this.suraModel, required this.index});
SuraModel suraModel;
int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context,RoutesManager.quranDetails,

        arguments: SuraDetailsArguments(suraModel: suraModel, index: index)
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
  int index;
  SuraDetailsArguments({required this.suraModel, required this.index});
}
