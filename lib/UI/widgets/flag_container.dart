import 'package:flag/flag.dart';
import 'package:flutter/material.dart';

class FlagContainer extends StatelessWidget {
  final String flagString;
  const FlagContainer({
    Key? key,
    required this.flagString,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 30,
      child: Flag.fromString(
        flagString,
        fit: BoxFit.fill,
        replacement: const SizedBox(
          height: 30,
          width: 40,
        ),
      ),
    );
  }
}
