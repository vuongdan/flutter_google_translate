import 'package:flutter/material.dart';
import 'package:flutter_ts5/screens/views/views.dart';

class MyScafold extends StatelessWidget {
  final int currentIndex;
  final double scafoldHeight;
  final double scafoldWidth;
  final double translateFieldHeight;
  const MyScafold({
    Key? key,
    required this.currentIndex,
    required this.scafoldHeight,
    required this.scafoldWidth,
    required this.translateFieldHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double languageViewHeight = 128;
    switch (currentIndex) {
      case 0:
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            height: scafoldHeight,
            width: scafoldWidth,
            decoration: const BoxDecoration(
                color: Color(0xff404661),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              children: [
                const LanguageView(
                  languageViewHeight: languageViewHeight,
                ),
                const SizedBox(
                  height: 8,
                ),
                TranslateView(
                  translateFieldHeight: translateFieldHeight,
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                    child: Row(
                  children: [
                    const Expanded(flex: 4, child: TranslateCardsListView()),
                    Expanded(child: Container())
                  ],
                ))
              ],
            ),
          ),
        );
      case 1:
        return Container(
            padding: const EdgeInsets.all(10),
            height: scafoldHeight,
            width: scafoldWidth,
            decoration: const BoxDecoration(
                color: Color(0xff404661),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: const TranslateCardsListView());
      case 2:
        return Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Color(0xff404661),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        );
      default:
        return Container();
    }
  }
}
