import 'package:flutter/material.dart';

class MasterMenuDialog extends StatelessWidget {
  final List<Widget> list;
  final double width;
  final double height;
  const MasterMenuDialog({
    Key? key,
    required this.list,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final i = list.length * 2 - 1;

    return AlertDialog(
      content: SizedBox(
        width: width,
        height: height,
        child: ListView.builder(
            itemCount: i,
            itemBuilder: (context, index) {
              final item = index ~/ 2;
              if (index.isEven) {
                return list[item];
              } else {
                return const Divider();
              }
            }),
      ),
    );
  }
}
