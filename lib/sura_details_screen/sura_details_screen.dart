

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c15_mon_nahas/core/assets_manager.dart';
import 'package:islami_c15_mon_nahas/core/colors_manager.dart';
import 'package:islami_c15_mon_nahas/main_layout/tabs/quran_tab/widgets/quran_item.dart';
import 'package:islami_c15_mon_nahas/sura_details_screen/sura_verse_widget.dart';

class SuraDetailsScreen extends StatefulWidget {
  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {

  List<String> suraVerses = [];
  late SuraDetailsArguments arguments;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    arguments =
    ModalRoute
        .of(context)
        ?.settings
        .arguments as SuraDetailsArguments;
    int index = int.parse(arguments.suraModel.suraIndex);
    loadSuraContentFromFile(index);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    arguments.mostRecentWidgetKey?.currentState?.refreshMostRecentSuras();
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(arguments.suraModel.suraNameEn)),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AssetsManager.quranDetailsShapeLeft),
              Text(
                arguments.suraModel.suraNameAr,
                style: TextStyle(
                  fontSize: 24,
                  color: ColorsManager.gold,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Image.asset(AssetsManager.quranDetailsShapeRight),
            ],
          ),
          Expanded(
            child:
            suraVerses.isEmpty
                ? Center(
              child: CircularProgressIndicator(
                color: ColorsManager.gold,
              ),
            )
                : ListView.builder(
              itemBuilder:
                  (context, index) =>
                  SuraVerseWidget(verse: suraVerses[index]),
              itemCount: suraVerses.length,
            ),
          ),
        ],
      ),
    );
  }


  void loadSuraContentFromFile(int index) async {
    String filePath = "assets/files/suras/$index.txt";
    String fileContent = await rootBundle.loadString(filePath);
    List<String> suraLines = fileContent.trim().split("\n");
    for (int i = 0; i < suraLines.length; i++) {
      suraLines[i] += "[${i + 1}]";
    }
    suraVerses = suraLines;
    await Future.delayed(Duration(seconds: 1));

    setState(() {});
  }
}
