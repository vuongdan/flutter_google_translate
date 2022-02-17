import 'package:flutter/material.dart';
import 'package:flutter_ts5/logic_bloc/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpeechToTextRecordButton extends StatelessWidget {
  const SpeechToTextRecordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeechToTextBloc, SpeechToTextState>(
        builder: (context, state) {
      if (state.status == SpeechToTextStatus.recognizing) {
        return IconButton(
            onPressed: () {
              context
                  .read<SpeechToTextBloc>()
                  .add(SpeechToTextStopRecognizing());
            },
            icon: const Icon(Icons.mic_none));
      } else {
        return IconButton(
            onPressed: () {
              context
                  .read<SpeechToTextBloc>()
                  .add(SpeechToTextStartRecognizing());
            },
            icon: const Icon(Icons.mic));
      }
    });
  }
}
