import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ts5/blocs/blocs.dart';
import 'package:flutter_ts5/constants/ts_constants.dart';

import '../../designs/app_themes.dart';

class TextToSpeechSettings extends StatelessWidget {
  const TextToSpeechSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextToSpeechBloc, TextToSpeechState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 20),
          child: Container(
            height: 160,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 95, 98, 110),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                Expanded(
                  child: Slider(
                      value: state.volume,
                      onChanged: (newVolume) {
                        context.read<TextToSpeechBloc>().add(
                            TextToSpeechChangeVolume(newVolume: newVolume));
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
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SetVoiceDropdownButton(),
                      Flag.fromString(
                        TextToSpeechConstants
                            .mapTextToSpeechVoiceAndLocaleToFlag(state.voice),
                        width: 30,
                        height: 20,
                        fit: BoxFit.scaleDown,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class SetVoiceDropdownButton extends StatelessWidget {
  const SetVoiceDropdownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<String>> items =
        TextToSpeechConstants.textToSpeechVoiceName
            // .textToSpeechLocales
            .map<DropdownMenuItem<String>>((String voice) {
      return DropdownMenuItem<String>(value: voice, child: Text(voice));
    }).toList();
    return BlocBuilder<TextToSpeechBloc, TextToSpeechState>(
        builder: (context, state) {
      return DropdownButton<String>(
        dropdownColor: const Color(0xff202842),
        value: state.voice,
        elevation: 16,
        style: MyThemeData.darkTheme.textTheme.bodyMedium,
        underline: Container(
            // color: Colors.deepPurpleAccent,
            ),
        items: items,
        onChanged: (String? newValue) {
          context
              .read<TextToSpeechBloc>()
              .add(TextToSpeechChangeVoice(newVoice: newValue));
        },
      );
    });
  }
}
