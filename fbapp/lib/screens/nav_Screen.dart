import 'package:fbapp/screens/Home_Screen.dart';
import 'package:flutter/material.dart';

class NavScreen extends StatelessWidget {
  final List<Widget> _screens = [
    const HomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];
  final List<IconData> _icons = const [
    Icons.home,
    Icons.ondemand_video,
    Icons.account_circle_outlined,
    Icons.doorbell_outlined,
    Icons.menu,
    Icons.group_outlined
  ];
  final int _selectedindex = 0;
  NavScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _icons.length,
        child: Scaffold(
          body: _screens[_selectedindex],
        ));
  }
}
// class CustomtabBar extends StatelessWidget {
//   final List<IconData> icons;
//   final int selectedindex;
//   final Function(int) onTap;
//    CustomtabBar({super.key,
//    required this.icons,
//    required this.onTap,
//    required this.selectedindex});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }