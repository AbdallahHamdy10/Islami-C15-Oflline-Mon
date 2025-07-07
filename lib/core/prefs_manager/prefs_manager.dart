import 'package:islami_c15_mon_nahas/core/strings_manager.dart';
import 'package:islami_c15_mon_nahas/core/sura_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsManager {
  /// 1 as int
  static void saveSuraIndex(int suraIndex) async {
    print("Cached Index: $suraIndex");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentSurasIndex =
        prefs.getStringList(CacheConstant.mostRecentSurasKey) ?? [];
    if (mostRecentSurasIndex.contains("$suraIndex")) {
      mostRecentSurasIndex.remove("$suraIndex");
    }
    mostRecentSurasIndex.add("$suraIndex");

    await prefs.setStringList(
      CacheConstant.mostRecentSurasKey,
      mostRecentSurasIndex,
    );
    print(mostRecentSurasIndex.length);
  }

  static Future<List<SuraModel>> getMostRecentSuras() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentSurasIndex = // ["1", "2", "3"]
        prefs.getStringList(CacheConstant.mostRecentSurasKey) ?? [];
    List<SuraModel> MostRecentSuras = [];
    for (int i = 0; i < mostRecentSurasIndex.length; i++) {
      int index = int.parse(mostRecentSurasIndex[i]);
      MostRecentSuras.add(SuraModel.suras[index - 1]);
    }
    return MostRecentSuras.reversed.toList();
  }

  static void cacheIsFirst(bool isFirst) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(CacheConstant.isFirst, isFirst);
  }

  static Future<bool> isFirst() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(CacheConstant.isFirst) ?? false;
  }
}
