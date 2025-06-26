import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_c15_mon_nahas/core/assets_manager.dart';
import 'package:islami_c15_mon_nahas/core/colors_manager.dart';

class HadithItemWidget extends StatefulWidget {
  HadithItemWidget({super.key, required this.index});

  int index;

  @override
  State<HadithItemWidget> createState() => _HadithItemWidgetState();
}

class _HadithItemWidgetState extends State<HadithItemWidget> {
  HadithModel? hadithModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadithFile();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
    
      decoration: BoxDecoration(
        image: DecorationImage(
            alignment: Alignment.center,
            image: AssetImage(AssetsManager.hadithCardBg)),
          color: ColorsManager.gold,
        borderRadius: BorderRadius.circular(12)
      ),


      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    AssetsManager.quranDetailsShapeLeft,
                    color: Colors.black,
                  ),
                  Image.asset(
                    AssetsManager.quranDetailsShapeRight,
                    color: Colors.black,
                  ),
                ],
              ),
              hadithModel == null
                  ? Center(child: CircularProgressIndicator(color: ColorsManager.black,))
                  : Text(hadithModel!.title,style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: ColorsManager.black),),
              // Text(hadithModel!.content)
            ],
          ),

          Expanded(
            child:
                hadithModel == null
                    ? Center(child: CircularProgressIndicator(color: ColorsManager.black,))
                    : SingleChildScrollView(child: Text(hadithModel!.content,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: ColorsManager.black)
                  ,textAlign: TextAlign.center,textDirection: TextDirection.rtl,)),
          ),
        ],
      ),
    );
  }

  void loadHadithFile() async {
    String filePath = "assets/files/hadith/h${widget.index}.txt";
    String hadithContent = await rootBundle.loadString(filePath);
    List<String> hadithLines = hadithContent.split('\n');
    String title = hadithLines[0];
    hadithLines.removeAt(0);
    String content = hadithLines.join();
    hadithModel = HadithModel(title: title, content: content);
    await Future.delayed(Duration(seconds: 1));
    setState(() {});
  }
}

class HadithModel {
  String title;
  String content;

  HadithModel({required this.title, required this.content});
}
