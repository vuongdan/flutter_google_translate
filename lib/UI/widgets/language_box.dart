import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_ts5/constants/google_translate_constants.dart';

import '../../logic_bloc/blocs.dart';
import 'widgets.dart';

class SourceLanguageBox extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  const SourceLanguageBox({
    Key? key,
    required this.text,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ListTile> list = GoogleTranslateConstants.languageCodes.map(
      (e) {
        return ListTile(
          title: Text(
              GoogleTranslateConstants.maplanguageCodeToName(languageCode: e)),
          onTap: () {
            context
                .read<GoogleTranslateBloc>()
                .add(GoogleTranslateChangeSourceLanguage(from: e));
            print(e);
            Navigator.pop(context);
          },
        );
      },
    ).toList();

    return BlocBuilder<GoogleTranslateBloc, GoogleTranslateState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MasterMenu(
                          list: list,
                          menuTitle: "Source Languages",
                        )));
          },
          child: SizedBox(
            height: height / 12,
            width: width / 5 * 2,
            child: Center(
                child: Text(
              text,
              style: const TextStyle(color: Colors.blue),
            )),
          ),
        );
      },
    );
  }
}

class TargetLanguageBox extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  const TargetLanguageBox({
    Key? key,
    required this.text,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ListTile> list = GoogleTranslateConstants.languageCodes.map(
      (e) {
        return ListTile(
          title: Text(
              GoogleTranslateConstants.maplanguageCodeToName(languageCode: e)),
          onTap: () {
            context
                .read<GoogleTranslateBloc>()
                .add(GoogleTranslateChangeTargetLanguage(to: e));
            Navigator.pop(context);
            print(e);
          },
        );
      },
    ).toList();

    return BlocBuilder<GoogleTranslateBloc, GoogleTranslateState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MasterMenu(
                          list: list,
                          menuTitle: "Target Languages",
                        )));
          },
          child: SizedBox(
            height: height / 12,
            width: width / 5 * 2,
            child: Center(
                child: Text(
              text,
              style: const TextStyle(color: Colors.blue),
            )),
          ),
        );
      },
    );
  }
}
