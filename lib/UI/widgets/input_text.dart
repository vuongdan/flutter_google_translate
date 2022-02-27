import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic_bloc/blocs.dart';

class InputText extends StatelessWidget {
  const InputText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpeechToTextBloc, SpeechToTextState>(
      builder: (context, state) {
        final TextEditingController textEditingController =
            TextEditingController(
                text: context.watch<GoogleTranslateBloc>().state.inputText)
              ..selection = TextSelection.collapsed(
                  offset: context
                      .watch<GoogleTranslateBloc>()
                      .state
                      .inputText
                      .length);
        if (state.status == SpeechToTextStatus.recognizing) {
          context
              .watch<GoogleTranslateBloc>()
              .add(GoogleTranslateTyping(inputText: state.recognizedWords));
          return Text(
            state.recognizedWords,
          );
        } else {
          return TextField(
            decoration: const InputDecoration(border: InputBorder.none),
            controller: textEditingController,
            onChanged: (text) {
              context
                  .read<GoogleTranslateBloc>()
                  .add(GoogleTranslateTyping(inputText: text));
            },
          );
        }
      },
    );
  }
}
