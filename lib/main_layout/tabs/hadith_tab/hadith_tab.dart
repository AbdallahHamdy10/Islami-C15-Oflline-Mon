import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_c15_mon_nahas/core/assets_manager.dart';
import 'package:islami_c15_mon_nahas/main_layout/tabs/hadith_tab/hadith_item_widget.dart';

class HadithTab extends StatelessWidget {
  const HadithTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(AssetsManager.hadithTabBg),
        ),
      ),
      child: Column(
        children: [
          Expanded(child: Image.asset(AssetsManager.islamiLogo)),
          Expanded(
            flex: 5,
            child: CarouselSlider(
              options: CarouselOptions(
                height: 450,
                reverse: false,

                enlargeCenterPage: true,
                enlargeFactor: 0.2,
                autoPlay: true,
                aspectRatio: 16 / 9,

                viewportFraction: 0.8,
              ),
              items:
                  List.generate(
                    4,
                    (index) => index,
                  ).map((index) => HadithItemWidget(index: index + 1)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
