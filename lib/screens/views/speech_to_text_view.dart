import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ts5/blocs/blocs.dart';

class SpeechToTextView extends StatelessWidget {
  const SpeechToTextView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<GoogleTranslateBloc>().add(GoogleTranslateTyping(
        inputText: context.watch<SpeechToTextBloc>().state.recognizedWords ==
                'Enter Voice'
            ? ""
            : context.watch<SpeechToTextBloc>().state.recognizedWords));
    context.read<TextToSpeechBloc>().add(TextToSpeechTyping(
        textToSpeechText:
            context.watch<GoogleTranslateBloc>().state.resultText));
    return Container(
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Center(
          child: Text(context.watch<SpeechToTextBloc>().state.recognizedWords),
        ));
  }
}
