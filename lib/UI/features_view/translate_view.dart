// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ts5/UI/widgets/widgets.dart';
import 'package:flutter_ts5/constants/google_translate_constants.dart';
import 'package:flutter_ts5/constants/text_to_speech_constants.dart';

import '../../logic_bloc/blocs.dart';

class TranslateView extends StatelessWidget {
  final double width;
  final double height;
  const TranslateView({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          LanguageField(height: height, width: width),

          const Divider(),
          Expanded(
              child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InputField(
                  height: height,
                  width: width,
                ),
                const SizedBox(
                  height: 2,
                ),
                ResultField(width: width, height: height)
              ],
            ),
          )),
          // input & result field
        ],
      ),
    );
  }
}

class LanguageField extends StatelessWidget {
  final double height;
  final double width;
  const LanguageField({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SourceLanguageBox(
          width: width,
          height: height,
          text: GoogleTranslateConstants.maplanguageCodeToName(
              languageCode:
                  context.watch<GoogleTranslateBloc>().state.sourceLanguage),
        ),
        GoogleTranslateSwapLanguagesButton(),
        TargetLanguageBox(
          width: width,
          height: height,
          text: GoogleTranslateConstants.maplanguageCodeToName(
              languageCode:
                  context.watch<GoogleTranslateBloc>().state.targetLanguage),
        ),
      ],
    );
  }
}

class InputField extends StatelessWidget {
  final double width;
  final double height;
  const InputField({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: width,
      height: height / 12 * 3,
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextToSpeechPlayButton(
                  voice: Voice(
                      name: "",
                      locale: context
                          .watch<SpeechToTextBloc>()
                          .state
                          .currentLocaleId),
                  text: context.watch<GoogleTranslateBloc>().state.inputText),
              Text(GoogleTranslateConstants.maplanguageCodeToName(
                      languageCode: context
                          .watch<GoogleTranslateBloc>()
                          .state
                          .sourceLanguage)
                  .toUpperCase()),
              Spacer(),
              GoogleTranslateClearInputButton()
            ],
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: InputText()),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.camera_alt)),
                SpeechToTextRecordButton(),
                IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ResultField extends StatelessWidget {
  final double width;
  final double height;
  const ResultField({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: width,
      height: height / 12 * 5,
      color: Colors.blue[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextToSpeechPlayButton(
                voice: context.watch<TextToSpeechBloc>().state.voice,
                text: context.watch<GoogleTranslateBloc>().state.resultText,
              ),
              Text(
                GoogleTranslateConstants.maplanguageCodeToName(
                        languageCode: context
                            .watch<GoogleTranslateBloc>()
                            .state
                            .targetLanguage)
                    .toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
              Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.star_border,
                    color: Colors.white,
                  )),
            ],
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ResultText()),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.crop_free,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.upgrade_sharp,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.content_copy_rounded,
                    color: Colors.white,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
