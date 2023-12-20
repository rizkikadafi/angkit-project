import 'package:angkit_project/controller/bottom_navigation_controller.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final List<MenuIcon> menuIcons;
  final BottomNavigationController controller;
  const BottomNavigation(
      {super.key, required this.menuIcons, required this.controller});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // children: _buildMenu(),
        children: widget.menuIcons,
      ),
    );
  }

  List<MenuIcon> _buildMenu() {
    List<MenuIcon> result = <MenuIcon>[];

    for (var menuIcon in widget.menuIcons) {
      result.add(menuIcon);
    }

    return result;
  }
}

class MenuIcon extends StatelessWidget {
  final IconData icon;
  final String? title;
  final Color? activeIconColor;
  final Color? activeTextColor;
  const MenuIcon(
      {super.key,
      required this.icon,
      this.title,
      this.activeIconColor,
      this.activeTextColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: activeIconColor ?? Colors.black,
        ),
        Text(
          title ?? "",
          style: TextStyle(color: activeTextColor ?? Colors.black),
        )
      ],
    );
  }
}
