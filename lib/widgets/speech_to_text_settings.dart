import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';
import '../designs/app_themes.dart';
import '../constants/ts_constants.dart';

class SpeechToTextSettings extends StatelessWidget {
  const SpeechToTextSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeechToTextBloc, SpeechToTextState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 20),
          child: Container(
            height: 120,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 95, 98, 110),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Column(
              children: [
                Expanded(
                  child: Slider(
                      value: state.listenDuration.toDouble(),
                      onChanged: (newListenDuration) {
                        context.read<SpeechToTextBloc>().add(
                            SpeechToTextChangeListenDuration(
                                newListenDuration: newListenDuration.toInt()));
                      },
                      min: 5,
                      max: 30.0,
                      divisions: 5,
                      label: "Listen Duration: ${state.listenDuration}"),
                ),
                Expanded(
                  child: Slider(
                    value: state.pauseDuration.toDouble(),
                    onChanged: (newPauseDuration) {
                      context.read<SpeechToTextBloc>().add(
                          SpeechToTextChangePauseDuration(
                              newPauseDuration: newPauseDuration.toInt()));
                    },
                    min: 0,
                    max: 5,
                    divisions: 5,
                    label: "Pause Duration: ${state.pauseDuration}",
                    activeColor: Colors.red,
                  ),
                ),
                const Expanded(child: Center(child: SetLocaleDropdownButton()))
              ],
            ),
          ),
        );
      },
    );
  }
}

class SetLocaleDropdownButton extends StatelessWidget {
  const SetLocaleDropdownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<String>> items = SpeechToTextConstants.localeIds
        // .SpeechToTextLocales
        .map<DropdownMenuItem<String>>((String localeIds) {
      return DropdownMenuItem<String>(
          value: localeIds,
          child: Text(SpeechToTextConstants.mapSpeechToTextLocaleIdToLocaleName(
              localeIds)));
    }).toList();
    return BlocBuilder<SpeechToTextBloc, SpeechToTextState>(
        builder: (context, state) {
      return DropdownButton<String>(
          dropdownColor: const Color(0xff202842),
          value: state.currentLocaleId,
          elevation: 16,
          style: MyThemeData.darkTheme.textTheme.bodyMedium,
          underline: Container(
              // color: Colors.deepPurpleAccent,
              ),
          items: items,
          onChanged: (String? newValue) {
            context
                .read<SpeechToTextBloc>()
                .add(SpeechToTextChangeLocale(newLocale: newValue));
          });
    });
  }
}
