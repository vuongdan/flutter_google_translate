import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ts5/blocs/blocs.dart';
import 'package:flutter_ts5/constants/ts_constants.dart';

import '../designs/app_themes.dart';

class SourceLanguageDropdownButton extends StatelessWidget {
  const SourceLanguageDropdownButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleTranslateBloc, GoogleTranslateState>(
      builder: (context, state) {
        return DropdownButton<String>(
          dropdownColor: const Color(0xff202842),
          value: state.from,
          icon: state.from == 'auto'
              ? Container(
                  width: 45,
                  height: 30,
                  color: const Color(0xff202842),
                )
              : Flag.fromString(
                  FlagConstants.mapLanguageCodeToFlagCode(state.from),
                  width: 45,
                  height: 30,
                  fit: BoxFit.scaleDown,
                ),
          style: MyThemeData.darkTheme.textTheme.bodyMedium,
          underline: Container(
              // color: Colors.deepPurpleAccent,
              ),
          onChanged: (String? newValue) {
            context
                .read<GoogleTranslateBloc>()
                .add(GoogleTranslateChangeSourceLanguage(from: newValue));
          },
          items: GoogleTranslateConstants.languageCodes
              .map<DropdownMenuItem<String>>((String code) {
            return DropdownMenuItem<String>(
                value: code,
                child: Text(
                    'Fr:   ${GoogleTranslateConstants.mapLanguageCodeToLanguageName(code)}'));
          }).toList(),
        );
      },
    );
  }
}

class TargetLanguageDropdownButton extends StatelessWidget {
  const TargetLanguageDropdownButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleTranslateBloc, GoogleTranslateState>(
      builder: (context, state) {
        return DropdownButton<String>(
          dropdownColor: const Color(0xff202842),
          value: state.to,
          icon: state.to == 'auto'
              ? Container(
                  width: 45,
                  height: 30,
                  color: const Color(0xff202842),
                )
              : Flag.fromString(
                  FlagConstants.mapLanguageCodeToFlagCode(state.to),
                  width: 45,
                  height: 30,
                  fit: BoxFit.scaleDown,
                ),
          style: MyThemeData.darkTheme.textTheme.bodyMedium,
          underline: Container(
              // color: Colors.deepPurpleAccent,
              ),
          onChanged: (String? newValue) {
            context
                .read<GoogleTranslateBloc>()
                .add(GoogleTranslateChangeTargetLanguage(to: newValue));
          },
          items: GoogleTranslateConstants.languageCodes
              .map<DropdownMenuItem<String>>((String code) {
            return DropdownMenuItem<String>(
                value: code,
                child: Text(
                    'To:   ${GoogleTranslateConstants.mapLanguageCodeToLanguageName(code)}'));
          }).toList(),
        );
      },
    );
  }
}
