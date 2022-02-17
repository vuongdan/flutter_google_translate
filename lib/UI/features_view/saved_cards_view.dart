import 'package:flutter/material.dart';

class SavedCardsView extends StatelessWidget {
  final double width;
  final double height;
  const SavedCardsView({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: width,
            height: height / 3,
            color: Colors.grey,
          ),
          Flexible(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: ((context, index) {
                    if (index.isEven) {
                      return ListTile(
                        title: Text(index.toString()),
                        trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.star_border)),
                      );
                    } else {
                      return const Divider();
                    }
                  })))
        ],
      ),
    );
  }
}
