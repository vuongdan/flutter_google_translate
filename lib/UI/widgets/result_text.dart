import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic_bloc/blocs.dart';

class ResultText extends StatelessWidget {
  const ResultText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleTranslateBloc, GoogleTranslateState>(
      builder: (context, state) {
        return Text(
          state.resultText,
          style: const TextStyle(color: Colors.white),
        );
      },
    );
  }
}
