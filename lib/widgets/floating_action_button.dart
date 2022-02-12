import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ts5/designs/app_themes.dart';

import '../blocs/blocs.dart';

class SpeechToTextRecordingButton extends StatelessWidget {
  const SpeechToTextRecordingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeechToTextBloc, SpeechToTextState>(
        builder: ((context, state) {
      return Center(
        child: FloatingActionButton(
            backgroundColor: MyThemeData.darkTheme.primaryColor,
            child: const Center(child: Icon(Icons.mic)),
            onPressed: () {
              state.isListening
                  ? context
                      .read<SpeechToTextBloc>()
                      .add(SpeechToTextCancelListening())
                  : context
                      .read<SpeechToTextBloc>()
                      .add(SpeechToTextStartListening());
            }),
      );
    }));
  }
}

class TextToSpeechPlayingButton extends StatelessWidget {
  const TextToSpeechPlayingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextToSpeechBloc, TextToSpeechState>(
      builder: (context, state) {
        return AvatarGlow(
            animate: state.status == TextToSpeechStatus.playing,
            glowColor: Colors.red,
            endRadius: 55,
            duration: const Duration(milliseconds: 1000),
            repeatPauseDuration: const Duration(milliseconds: 100),
            repeat: true,
            child: Center(
              child: FloatingActionButton(
                backgroundColor: MyThemeData.darkTheme.primaryColor,
                onPressed: () {
                  state.status != TextToSpeechStatus.playing
                      ? context.read<TextToSpeechBloc>().add(TextToSpeechPlay(
                          textToSpeechText: state.textToSpeechText))
                      : context
                          .read<TextToSpeechBloc>()
                          .add(TextToSpeechStop());
                },
                child: state.status == TextToSpeechStatus.playing
                    ? const Center(child: Icon(Icons.stop))
                    : const Center(child: Icon(Icons.music_note)),
              ),
            ));
      },
    );
  }
}
