import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ts5/logic_bloc/google_translate_bloc/google_translate_bloc.dart';

class GoogleTranslateSwapLanguagesButton extends StatelessWidget {
  const GoogleTranslateSwapLanguagesButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context
              .read<GoogleTranslateBloc>()
              .add(GoogleTranslateSwapLanguages());
        },
        icon: const Icon(Icons.compare_arrows));
  }
}
