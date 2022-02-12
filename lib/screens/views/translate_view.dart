import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class TranslateView extends StatelessWidget {
  final double translateFieldHeight;
  const TranslateView({
    Key? key,
    required this.translateFieldHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: translateFieldHeight,
      decoration: const BoxDecoration(
          color: Color(0xff202842),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: const [
          InputField(),
          ResultField(),
        ],
      ),
    );
  }
}
