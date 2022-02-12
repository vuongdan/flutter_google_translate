import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onTap;
  const MyBottomNavigationBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.home, color: Colors.blue),
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'Home'),
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.star, color: Colors.blue),
            icon: Icon(Icons.star, color: Colors.white),
            label: 'Saved'),
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.settings, color: Colors.blue),
            icon: Icon(Icons.settings, color: Colors.white),
            label: 'Setting'),
        BottomNavigationBarItem(
            activeIcon: Icon(Icons.perm_identity, color: Colors.blue),
            icon: Icon(Icons.perm_identity, color: Colors.white),
            label: 'Blah'),
      ],
    );
  }
}
