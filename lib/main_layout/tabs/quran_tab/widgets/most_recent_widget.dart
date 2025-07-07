import 'package:flutter/material.dart';
import 'package:islami_c15_mon_nahas/core/colors_manager.dart';
import 'package:islami_c15_mon_nahas/core/prefs_manager/prefs_manager.dart';
import 'package:islami_c15_mon_nahas/core/sura_model.dart';
import 'package:islami_c15_mon_nahas/main_layout/tabs/quran_tab/widgets/most_recent_item.dart';

class MostRecentWidget extends StatefulWidget {
  const MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => MostRecentWidgetState();
}

class MostRecentWidgetState extends State<MostRecentWidget> {
  List<SuraModel> suras =[];

 void  refreshMostRecentSuras()async{
    suras =await  PrefsManager.getMostRecentSuras();
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshMostRecentSuras();

  }
  @override
  Widget build(BuildContext context) {
    return    SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.18,
      child: Container(
        margin: EdgeInsets.only(left: 10),
        child: suras.isEmpty ? Center(child: Text("No Most Recent...", style: TextStyle(fontSize: 18, color: ColorsManager.ofWhite, fontWeight: FontWeight.w400),)):ListView.separated(
          separatorBuilder: (context, index) => SizedBox(width: 5),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => MostRecentItem(suraModel: suras[index],),
          itemCount: suras.length,
        ),
      ),
    );
  }
}
