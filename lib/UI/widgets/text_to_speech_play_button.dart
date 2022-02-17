import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ts5/constants/text_to_speech_constants.dart';

import '../../logic_bloc/blocs.dart';

class TextToSpeechPlayButton extends StatelessWidget {
  final Voice voice;
  final String text;
  const TextToSpeechPlayButton({
    Key? key,
    required this.voice,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextToSpeechBloc, TextToSpeechState>(
        builder: (context, state) {
      if (state.status == TextToSpeechStatus.playing) {
        return IconButton(
            onPressed: () {
              context.read<TextToSpeechBloc>().add(TextToSpeechStop());
            },
            icon: const Icon(Icons.pause));
      } else {
        return IconButton(
            onPressed: () {
              context
                  .read<TextToSpeechBloc>()
                  .add(TextToSpeechPlay(voice: voice, text: text));
            },
            icon: const Icon(Icons.volume_up));
      }
    });
  }
}
