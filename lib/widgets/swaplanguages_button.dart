import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ts5/blocs/blocs.dart';

class SwapLanguageButton extends StatelessWidget {
  const SwapLanguageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GoogleTranslateBloc, GoogleTranslateState>(
        builder: (context, state) {
      return InkWell(
        onTap: () {
          state.from == 'auto'
              ? null
              : context.read<GoogleTranslateBloc>().add(
                  GoogleTranslateSwapLanguages(
                      currentFrom: state.from, currentTo: state.to));
        },
        child: Container(
          width: 60,
          height: 60,
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
          child: const Icon(Icons.compare_arrows),
        ),
      );
    });
  }
}
