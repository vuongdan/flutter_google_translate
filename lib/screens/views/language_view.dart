import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ts5/constants/ts_constants.dart';

import '../../blocs/blocs.dart';
import '../../widgets/widgets.dart';

class LanguageView extends StatelessWidget {
  final double languageViewHeight;
  const LanguageView({
    Key? key,
    required this.languageViewHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: languageViewHeight,
      child: Stack(
        children: [
          UnderStack(
            languageViewHeight: languageViewHeight,
          ),
          AboveStack(
            languageViewHeight: languageViewHeight,
          )
        ],
      ),
    );
  }
}

class UnderStack extends StatelessWidget {
  final double languageViewHeight;
  const UnderStack({
    Key? key,
    required this.languageViewHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            height: 60,
            width: double.infinity,
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Color(0xFF6E4FAF), spreadRadius: 2),
                ],
                color: Color(0xff202842),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: SingleLanguageWidget(
              languageCode: context.watch<GoogleTranslateBloc>().state.from,
            )),
        const SizedBox(
          height: 8,
        ),
        Container(
            height: 60,
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(color: Color(0xFF6E4FAF), spreadRadius: 2),
                ],
                color: Color(0xff202842),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: SingleLanguageWidget(
              languageCode: context.watch<GoogleTranslateBloc>().state.to,
            )),
      ],
    );
    //   },
    // );
  }
}

class AboveStack extends StatelessWidget {
  final double languageViewHeight;
  const AboveStack({
    Key? key,
    required this.languageViewHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: languageViewHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 69,
              height: 69,
              decoration: const BoxDecoration(boxShadow: [
                BoxShadow(color: Color(0xFF6E4FAF), spreadRadius: 2),
              ], shape: BoxShape.circle, color: Color(0xff404661)),
            ),
            const SizedBox(
              width: 30,
            )
          ],
        ),
      ),
      SizedBox(
        height: 128,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
                child: Container(
              height: 4,
              width: 355,
              color: const Color(0xff404661),
            ))
          ],
        ),
      ),
      SizedBox(
        height: 128,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            SizedBox(
              width: 128,
              height: 128,
              child: Center(child: SwapLanguageButton()),
            ),
          ],
        ),
      )
    ]);
  }
}

class SingleLanguageWidget extends StatelessWidget {
  final String languageCode;
  const SingleLanguageWidget({
    Key? key,
    required this.languageCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          width: 20,
        ),
        languageCode == 'auto'
            ? Container(
                width: 45,
                height: 30,
                color: const Color(0xff202842),
              )
            : Flag.fromString(
                FlagConstants.mapLanguageCodeToFlagCode(languageCode),
                width: 45,
                height: 30,
                fit: BoxFit.scaleDown,
              ),
        const SizedBox(
          width: 20,
        ),
        Text(
          GoogleTranslateConstants.mapLanguageCodeToLanguageName(languageCode),
        )
      ],
    );
  }
}
