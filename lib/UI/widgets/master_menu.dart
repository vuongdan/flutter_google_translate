import 'package:flutter/material.dart';

class MasterMenu extends StatelessWidget {
  final List<Widget> list;
  final String menuTitle;
  const MasterMenu({
    Key? key,
    required this.list,
    required this.menuTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final i = list.length * 2 - 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(menuTitle),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
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
