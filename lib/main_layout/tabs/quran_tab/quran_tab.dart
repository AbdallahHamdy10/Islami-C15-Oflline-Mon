import 'package:flutter/material.dart';
import 'package:islami_c15_mon_nahas/core/colors_manager.dart';
import 'package:islami_c15_mon_nahas/core/sura_model.dart';
import 'package:islami_c15_mon_nahas/main_layout/tabs/quran_tab/widgets/most_recent_item.dart';
import 'package:islami_c15_mon_nahas/main_layout/tabs/quran_tab/widgets/most_recent_widget.dart';
import 'package:islami_c15_mon_nahas/main_layout/tabs/quran_tab/widgets/quran_item.dart';

class QuranTab extends StatefulWidget {
   QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  late GlobalKey<MostRecentWidgetState> mostRecentSurasWidget ;
  List<SuraModel> filteredSuras = SuraModel.suras; /// 114 sura
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mostRecentSurasWidget = GlobalKey<MostRecentWidgetState>();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/quran_tab_logo.png",
              height: 70,
              alignment: Alignment.center,
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(

              onChanged: (input) {
                searchForSuraBySearchKey(input);
              },
              style: TextStyle(
                fontSize: 16,
                color: ColorsManager.white,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
              prefixIcon: ImageIcon(AssetImage("assets/images/quran_icon.png")),
              prefixIconColor: ColorsManager.gold
              ,labelText: "Sura name"),
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height * 0.02),
          Container(
            margin: EdgeInsets.only(bottom: 10, left: 20),
            child: Text("Most Recently", style: TextStyle(color: Colors.white)),
          ),
          MostRecentWidget(key: mostRecentSurasWidget,),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text("Sura List", style: TextStyle(color: Colors.white)),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 64, vertical: 10),
                  width: double.infinity,
                  height: 1,
                  color: Colors.white,
                );
              },
              itemBuilder:
                  (context, index) => QuranItem(
                    mostRecentWidgetKey: mostRecentSurasWidget,
                    suraModel: filteredSuras[index],
                    index: index,
                  ),
              itemCount: filteredSuras.length
            ),
          ),
        ],
      ),
    );
  }

  void searchForSuraBySearchKey(String searchKey) {
    print("searchKey: ${searchKey}");
   filteredSuras =  SuraModel.suras.where((sura) => sura.suraNameEn.toLowerCase().contains(searchKey.toLowerCase())|| sura.suraNameAr.contains(searchKey)).toList();


   setState(() {

   });
  }
}
