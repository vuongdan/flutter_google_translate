import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ts5/blocs/blocs.dart';

import '../designs/app_themes.dart';
import '../constants/ts_constants.dart';

class InputField extends StatelessWidget {
  const InputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final text = context.watch<GoogleTranslateBloc>().state.inputText;
    final TextEditingController textEditingController =
        TextEditingController(text: text)
          ..selection = TextSelection.collapsed(offset: text.length);

    return BlocBuilder<GoogleTranslateBloc, GoogleTranslateState>(
        builder: ((context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: TextFormField(
          style: MyThemeData.darkTheme.textTheme.bodyMedium,
          controller: textEditingController,
          minLines: 2,
          maxLines: 5,
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.done,
          onChanged: (text) {
            context
                .read<GoogleTranslateBloc>()
                .add(GoogleTranslateTyping(inputText: text));
          },
          decoration: InputDecoration(
              label: Text(
                '>> ${GoogleTranslateConstants.mapLanguageCodeToLanguageName(state.from)}',
              ),
              labelStyle: MyThemeData.darkTheme.textTheme.bodyMedium,
              border: InputBorder.none,
              hintText: 'Enter text',
              hintStyle: MyThemeData.darkTheme.textTheme.bodyMedium),
        ),
      );
    }));
  }
}
