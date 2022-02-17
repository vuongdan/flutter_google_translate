// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ts5/logic_bloc/blocs.dart';

class GoogleTranslateClearInputButton extends StatelessWidget {
  const GoogleTranslateClearInputButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context
              .read<GoogleTranslateBloc>()
              .add(const GoogleTranslateTyping(inputText: ""));
        },
        icon: const Icon(Icons.cancel));
  }
}
