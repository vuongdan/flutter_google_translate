import 'package:flutter/material.dart';
import 'package:flutter_ts5/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants/ts_constants.dart';

class ResultField extends StatelessWidget {
  const ResultField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextToSpeechBloc, TextToSpeechState>(
      builder: (context, state) {
        final text = context.watch<GoogleTranslateBloc>().state.resultText;
        context
            .read<TextToSpeechBloc>()
            .add(TextToSpeechTyping(textToSpeechText: text));
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Text(
                '>> ${GoogleTranslateConstants.mapLanguageCodeToLanguageName(context.watch<GoogleTranslateBloc>().state.to)}',
                style: TextStyle(fontSize: text.isNotEmpty ? 15 : 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                        context.watch<GoogleTranslateBloc>().state.resultText),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
