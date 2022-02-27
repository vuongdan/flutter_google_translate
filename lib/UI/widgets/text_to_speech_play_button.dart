import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic_bloc/blocs.dart';

class TextToSpeechPlayButton1 extends StatelessWidget {
  final String text;
  const TextToSpeechPlayButton1({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextToSpeechBloc, TextToSpeechState>(
        builder: (context, state) {
      switch (state.status) {
        case TextToSpeechStatus.playing1:
          return IconButton(
              onPressed: () {
                context.read<TextToSpeechBloc>().add(TextToSpeechStop());
              },
              icon: Icon(
                Icons.pause,
              ));

        default:
          return IconButton(
              onPressed: () {
                context
                    .read<TextToSpeechBloc>()
                    .add(TextToSpeechPlay(voice: state.voice, text: text));
              },
              icon: Icon(
                Icons.volume_up,
              ));
      }
    });
  }
}

class TextToSpeechPlayButton2 extends StatelessWidget {
  final String text;
  const TextToSpeechPlayButton2({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextToSpeechBloc, TextToSpeechState>(
        builder: (context, state) {
      switch (state.status) {
        case TextToSpeechStatus.playing2:
          return IconButton(
              onPressed: () {
                context.read<TextToSpeechBloc>().add(TextToSpeechStop());
              },
              icon: Icon(Icons.pause, color: Colors.white));

        default:
          return IconButton(
              onPressed: () {
                context
                    .read<TextToSpeechBloc>()
                    .add(TextToSpeechPlay2(voice2: state.voice2, text: text));
              },
              icon: Icon(Icons.volume_up, color: Colors.white));
      }
    });
  }
}
