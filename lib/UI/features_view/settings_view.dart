import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ts5/constants/google_translate_constants.dart';

import '../../logic_bloc/blocs.dart';
import '../widgets/widgets.dart';

class SettingsView extends StatelessWidget {
  final double width;
  final double height;
  const SettingsView({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SpeechToTextSettingView(
            width: width,
            height: height,
          ),
          const SizedBox(
            height: 5,
          ),
          TextToSpeechSettingView(
            height: height,
            width: width,
          )
        ],
      ),
    );
  }
}

class SpeechToTextSettingView extends StatelessWidget {
  final double height;
  final double width;
  const SpeechToTextSettingView({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeechToTextBloc, SpeechToTextState>(
      builder: (context, state) {
        final List<ListTile> list = state.localeNames.map(
          (e) {
            return ListTile(
              leading: FlagContainer(
                flagString: e.localeId.substring(3, 5),
              ),
              title: Text(GoogleTranslateConstants.maplanguageCodeToName(
                  languageCode: e.localeId.substring(0, 2))),
              onTap: () {
                context.read<GoogleTranslateBloc>().add(
                    GoogleTranslateChangeSourceLanguage(
                        from: e.localeId.substring(0, 2)));
                context
                    .read<SpeechToTextBloc>()
                    .add(SpeechToTextChangeLocale(newLocale: e.localeId));
                Navigator.pop(context);
              },
            );
          },
        ).toList();
        return Container(
          padding: const EdgeInsets.all(8),
          height: height / 3,
          width: width,
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    const Text(
                      'Speech To Text',
                      style: TextStyle(fontSize: 18),
                    ),
                    const Spacer(),
                    IconButton(
                        onPressed: () {
                          context
                              .read<SpeechToTextBloc>()
                              .add(SpeechToTextInitData());
                        },
                        icon: const Icon(Icons.autorenew)),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => MasterMenuDialog(
                            width: width,
                            height: height,
                            list: list,
                          ));
                },
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 25,
                      ),
                      FlagContainer(
                        flagString: state.currentLocaleId.substring(3, 5),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        GoogleTranslateConstants.maplanguageCodeToName(
                            languageCode:
                                state.currentLocaleId.substring(0, 2)),
                        style: const TextStyle(fontSize: 16),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios),
                      const SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                ),
              ),
              Slider(
                  value: state.listenDuration.toDouble(),
                  onChanged: (newListenDuration) {
                    context.read<SpeechToTextBloc>().add(
                        SpeechToTextChangeListenDuration(
                            newListenDuration: newListenDuration.toInt()));
                  },
                  min: 5,
                  max: 30.0,
                  divisions: 25,
                  label: "Listen Duration: ${state.listenDuration}"),
              Slider(
                  value: state.pauseDuration.toDouble(),
                  onChanged: (newPauseDuration) {
                    context.read<SpeechToTextBloc>().add(
                        SpeechToTextChangePauseDuration(
                            newPauseDuration: newPauseDuration.toInt()));
                  },
                  min: 1,
                  max: 5,
                  divisions: 4,
                  label: "Pause Duration: ${state.pauseDuration}"),
            ],
          ),
        );
      },
    );
  }
}

class TextToSpeechSettingView extends StatelessWidget {
  final double width;
  final double height;
  const TextToSpeechSettingView({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextToSpeechBloc, TextToSpeechState>(
      builder: (context, state) {
        final List<ListTile> list = state.voices.map(
          (e) {
            return ListTile(
              leading: FlagContainer(
                flagString: e.locale.substring(3, 5),
              ),
              title: Text(e.name),
              subtitle: Text(GoogleTranslateConstants.maplanguageCodeToName(
                  languageCode: e.locale.substring(0, 2))),
              onTap: () {
                context
                    .read<TextToSpeechBloc>()
                    .add(TextToSpeechChangeVoice(newVoice: e));
                Navigator.pop(context);
              },
            );
          },
        ).toList();

        return Container(
          padding: const EdgeInsets.all(8),
          height: height / 5 * 2,
          width: width,
          decoration: BoxDecoration(
              color: Colors.grey[300], borderRadius: BorderRadius.circular(20)),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  const Text(
                    'Text To Speech',
                    style: TextStyle(fontSize: 18),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        context
                            .read<TextToSpeechBloc>()
                            .add(TextToSpeechInitData());
                      },
                      icon: const Icon(Icons.autorenew)),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => MasterMenuDialog(
                          width: width,
                          height: height,
                          list: list,
                        ));
              },
              child: SizedBox(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    FlagContainer(
                      flagString: state.voice.locale.substring(3, 5),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "${state.voice.name} (${GoogleTranslateConstants.maplanguageCodeToName(languageCode: state.voice.locale.substring(0, 2))})",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios),
                    const SizedBox(
                      width: 15,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Slider(
                  value: state.volume,
                  onChanged: (newVolume) {
                    context
                        .read<TextToSpeechBloc>()
                        .add(TextToSpeechChangeVolume(newVolume: newVolume));
                  },
                  min: 0.0,
                  max: 1.0,
                  divisions: 10,
                  label: "Volume: ${state.volume}"),
            ),
            Expanded(
              child: Slider(
                value: state.pitch,
                onChanged: (newPitch) {
                  context
                      .read<TextToSpeechBloc>()
                      .add(TextToSpeechChangePitch(newPitch: newPitch));
                },
                min: 0.5,
                max: 2.0,
                divisions: 15,
                label: "Pitch: ${state.pitch}",
                activeColor: Colors.red,
              ),
            ),
            Expanded(
              child: Slider(
                value: state.rate,
                onChanged: (newRate) {
                  context
                      .read<TextToSpeechBloc>()
                      .add(TextToSpeechChangeRate(newRate: newRate));
                },
                min: 0.0,
                max: 1.0,
                divisions: 10,
                label: "Speed: ${state.rate}",
                activeColor: Colors.green,
              ),
            )
          ]),
        );
      },
    );
  }
}
