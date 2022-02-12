import 'package:flutter/material.dart';

import '../../designs/app_themes.dart';
import '../../widgets/widgets.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: MyThemeData.darkTheme.cardColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: MyThemeData.darkTheme.backgroundColor,
              height: 76,
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    height: 36,
                  ),
                  Center(
                    child: Text(
                      'Settings',
                      style: MyThemeData.darkTheme.textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 30,
                  child: const Text(
                    'Translate Card',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Column(
                children: const [
                  SourceLanguageDropdownButton(),
                  TargetLanguageDropdownButton()
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 30,
                  child: const Text(
                    'Text to Speech',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 160, child: TextToSpeechSettings()),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 30,
                  child: const Text(
                    'Speech to text',
                  ),
                ),
              ],
            ),
            const SpeechToTextSettings()
          ],
        ),
      ),
    );
  }
}
